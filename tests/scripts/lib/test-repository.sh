#!/usr/bin/env bash

set -euo pipefail

readonly TEST_EXPECTED_ORIGIN="https://github.com/soyona/SAPDP"

create_test_repository() {
  local normative=normative
  SOURCE_ROOT=$(git rev-parse --show-toplevel)
  TEST_ROOT=$(mktemp -d)
  TEST_REPO="${TEST_ROOT}/work"
  TEST_REMOTE="${TEST_ROOT}/remote.git"

  git init --quiet --bare "$TEST_REMOTE"
  git init --quiet --initial-branch=main "$TEST_REPO"
  git -C "$TEST_REPO" config user.name "SAPDP Test"
  git -C "$TEST_REPO" config user.email "sapdp-test@example.invalid"
  git -C "$TEST_REPO" config protocol.file.allow always

  mkdir -p \
    "$TEST_REPO/scripts/lib" \
    "$TEST_REPO/protocol/flows/protocol-evolution" \
    "$TEST_REPO/docs/history/protocol-evolution"

  cp "$SOURCE_ROOT/scripts/sapdp-context" "$TEST_REPO/scripts/"
  cp "$SOURCE_ROOT/scripts/sapdp-materialize" "$TEST_REPO/scripts/"
  cp "$SOURCE_ROOT/scripts/sapdp-audit" "$TEST_REPO/scripts/"
  cp "$SOURCE_ROOT/scripts/sapdp-release" "$TEST_REPO/scripts/"
  cp "$SOURCE_ROOT/scripts/sapdp-handoff" "$TEST_REPO/scripts/"
  cp "$SOURCE_ROOT/scripts/lib/sapdp-validation.sh" "$TEST_REPO/scripts/lib/"

  cat >"$TEST_REPO/scripts/sapdp-validate" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
printf 'PASS\n'
EOF
  chmod +x \
    "$TEST_REPO/scripts/sapdp-materialize" \
    "$TEST_REPO/scripts/sapdp-audit" \
    "$TEST_REPO/scripts/sapdp-release" \
    "$TEST_REPO/scripts/sapdp-handoff" \
    "$TEST_REPO/scripts/sapdp-context" \
    "$TEST_REPO/scripts/sapdp-validate" \
    "$TEST_REPO/scripts/lib/sapdp-validation.sh"

  printf '%s\n' \
    '# Fixture Authority' \
    '' \
    '<!-- SAPDP Authority Metadata Start -->' \
    'authority=normative' \
    'kind=module' \
    'owner_id=fixture' \
    'component_id=main' \
    'schema=sapdp-authority-v1' \
    '<!-- SAPDP Authority Metadata End -->' \
    '' \
    'fixture=v1' >"$TEST_REPO/protocol/fixture.md"

  cat >"$TEST_REPO/protocol/flows/protocol-evolution.md" <<EOF
# Test Protocol Evolution

<!-- SAPDP Authority Metadata Start -->
authority=${normative}
kind=flow
owner_id=protocol-evolution
component_id=main
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

stage_authority=1|flow|protocol-evolution|evolution-definition
stage_authority=2|flow|protocol-evolution|design
stage_authority=3|flow|protocol-evolution|design-audit
stage_authority=4|flow|protocol-evolution|design-freeze
stage_authority=5|flow|protocol-evolution|materialization
stage_authority=6|flow|protocol-evolution|repository-audit
stage_authority=7|flow|protocol-evolution|release
EOF

  for component in \
    evolution-definition \
    design \
    design-audit \
    design-freeze \
    materialization \
    repository-audit \
    release
  do
    dependency=
    if [[ $component == materialization || $component == repository-audit || \
      $component == design-freeze ]]; then
      dependency='depends_on=flow|protocol-evolution|thread-handoff'
    fi
    cat >"$TEST_REPO/protocol/flows/protocol-evolution/${component}.md" <<EOF
# Test ${component}

<!-- SAPDP Authority Metadata Start -->
authority=${normative}
kind=flow
owner_id=protocol-evolution
component_id=${component}
schema=sapdp-authority-v1
${dependency}
<!-- SAPDP Authority Metadata End -->
EOF
  done

  cat >"$TEST_REPO/protocol/flows/protocol-evolution/thread-handoff.md" <<EOF
# Test thread-handoff

<!-- SAPDP Authority Metadata Start -->
authority=${normative}
kind=flow
owner_id=protocol-evolution
component_id=thread-handoff
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->
EOF

  cat >"$TEST_REPO/SAPDP.md" <<'EOF'
# SAPDP v0.0.0 Protocol

Authority Digest: sha256:PLACEHOLDER

<!-- Runtime Capsule Start -->
capsule_schema=sapdp-runtime-capsule-v1
authority_registry_location=SAPDP.md
undefined=NOT DEFINED IN SAPDP.md
<!-- Runtime Capsule End -->

<!-- Authority Registry Start -->
authority|module|fixture|main|protocol/fixture.md
authority|flow|protocol-evolution|main|protocol/flows/protocol-evolution.md
authority|flow|protocol-evolution|design|protocol/flows/protocol-evolution/design.md
authority|flow|protocol-evolution|design-audit|protocol/flows/protocol-evolution/design-audit.md
authority|flow|protocol-evolution|design-freeze|protocol/flows/protocol-evolution/design-freeze.md
authority|flow|protocol-evolution|evolution-definition|protocol/flows/protocol-evolution/evolution-definition.md
authority|flow|protocol-evolution|materialization|protocol/flows/protocol-evolution/materialization.md
authority|flow|protocol-evolution|release|protocol/flows/protocol-evolution/release.md
authority|flow|protocol-evolution|repository-audit|protocol/flows/protocol-evolution/repository-audit.md
authority|flow|protocol-evolution|thread-handoff|protocol/flows/protocol-evolution/thread-handoff.md
<!-- Authority Registry End -->
EOF

  (
    cd "$TEST_REPO"
    # shellcheck source=scripts/lib/sapdp-validation.sh
    source scripts/lib/sapdp-validation.sh
    digest=$(sapdp_authority_digest)
    awk -v digest="$digest" '
      /^Authority Digest:/ { print "Authority Digest: sha256:" digest; next }
      { print }
    ' SAPDP.md >SAPDP.md.tmp
    mv SAPDP.md.tmp SAPDP.md

    git add .
    git commit --quiet -m "Fixture base"
    TEST_BASE=$(git rev-parse HEAD)
    printf '%s\n' "$TEST_BASE" >"${TEST_ROOT}/base"

    git remote add origin "$TEST_EXPECTED_ORIGIN"
    git config "url.file://${TEST_REMOTE}.insteadOf" "$TEST_EXPECTED_ORIGIN"
    git push --quiet origin HEAD:refs/heads/main
  )

  TEST_BASE=$(cat "${TEST_ROOT}/base")
  export SOURCE_ROOT TEST_ROOT TEST_REPO TEST_REMOTE TEST_BASE
}

prepare_test_candidate() {
  local payload digest findings_digest
  TEST_VERSION=v0.0.1
  TEST_FREEZE="docs/history/protocol-evolution/${TEST_VERSION}/design-freeze.md"
  TEST_FINDINGS="docs/history/protocol-evolution/${TEST_VERSION}/findings.md"

  mkdir -p "${TEST_REPO}/$(dirname "$TEST_FREEZE")"
  sed 's/^# SAPDP v0\.0\.0 Protocol$/# SAPDP v0.0.1 Protocol/' \
    "$TEST_REPO/SAPDP.md" >"$TEST_REPO/SAPDP.md.tmp"
  mv "$TEST_REPO/SAPDP.md.tmp" "$TEST_REPO/SAPDP.md"
  printf '\nfixture=v2\n' >>"$TEST_REPO/protocol/fixture.md"
  cat >"${TEST_REPO}/${TEST_FINDINGS}" <<'EOF'
# Test Findings Snapshot

status:
RESOLVED
EOF
  findings_digest=$(
    LC_ALL=C LC_CTYPE=C LANG=C shasum -a 256 \
      "${TEST_REPO}/${TEST_FINDINGS}" |
      awk '{print $1}'
  )

  payload=$(cat <<EOF
base_commit_sha=${TEST_BASE}
current_version=v0.0.0
target_version=${TEST_VERSION}
runtime_baseline_source_ref=v0.0.0
runtime_baseline_source_commit=${TEST_BASE}
runtime_baseline_digest=sha256:0000000000000000000000000000000000000000000000000000000000000000
dependency_schema=sapdp-authority-dependency-v2
runtime_capsule_schema=sapdp-runtime-capsule-v1
context_schema=sapdp-context-v1
findings_snapshot_path=${TEST_FINDINGS}
findings_snapshot_digest=sha256:${findings_digest}
approved_behavior_change=Fixture change.
frozen_file=SAPDP.md
frozen_file=${TEST_FREEZE}
frozen_file=${TEST_FINDINGS}
frozen_file=protocol/fixture.md
required_change=Update fixture.
validation=./scripts/sapdp-validate
constraint=Fixture only.
commit_message=Fixture candidate
EOF
)
  digest=$(printf '%s\n' "$payload" | shasum -a 256 | awk '{print $1}')
  TEST_FREEZE_DIGEST="sha256:${digest}"

  cat >"${TEST_REPO}/${TEST_FREEZE}" <<EOF
# Test Design Freeze

Status: FROZEN
Freeze Digest: ${TEST_FREEZE_DIGEST}

<!-- Frozen Payload Start -->
${payload}
<!-- Frozen Payload End -->
EOF

  export TEST_VERSION TEST_FREEZE TEST_FREEZE_DIGEST TEST_FINDINGS
}

reject_next_remote_update() {
  cat >"${TEST_REMOTE}/hooks/pre-receive" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
if [[ -f hooks/reject-next ]]; then
  rm -f hooks/reject-next
  printf 'intentional test rejection\n' >&2
  exit 1
fi
cat >/dev/null
EOF
  chmod +x "${TEST_REMOTE}/hooks/pre-receive"
  touch "${TEST_REMOTE}/hooks/reject-next"
}

materialize_test_candidate() {
  local output
  output=$(
    cd "$TEST_REPO"
    ./scripts/sapdp-materialize \
      --freeze-file "$TEST_FREEZE" \
      --expected-freeze-digest "$TEST_FREEZE_DIGEST"
  ) || return $?
  printf '%s\n' "$output"
}

cleanup_test_repository() {
  [[ -n ${TEST_ROOT:-} ]] && rm -rf "$TEST_ROOT"
}
