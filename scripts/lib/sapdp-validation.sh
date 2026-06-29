#!/usr/bin/env bash

export LC_ALL=C
export LC_CTYPE=C
export LANG=C

sha256_stdin() {
  LC_ALL=C LC_CTYPE=C LANG=C shasum -a 256 | awk '{print $1}'
}

sapdp_sha256_file() {
  LC_ALL=C LC_CTYPE=C LANG=C shasum -a 256 "$1" | awk '{print $1}'
}

sapdp_repo_root() {
  git rev-parse --show-toplevel 2>/dev/null
}

sapdp_remote_ref() {
  local remote=$1 ref=$2 output
  output=$(git ls-remote "$remote" "$ref") || return 1
  awk 'NR == 1 { print $1 }' <<<"$output"
}

sapdp_heading_version() {
  local heading
  heading=$(sed -n '1p' SAPDP.md)
  if [[ $heading =~ ^#\ SAPDP\ (v[0-9]+\.[0-9]+\.[0-9]+)\ Protocol$ ]]; then
    printf '%s\n' "${BASH_REMATCH[1]}"
    return 0
  fi
  return 1
}

sapdp_registry_paths() {
  awk '
    /^<!-- Authority Registry Start -->$/ { active = 1; next }
    /^<!-- Authority Registry End -->$/ { active = 0 }
    active && /^authority\|/ {
      count = split($0, fields, "|")
      if (count != 5) exit 2
      print fields[5]
    }
  ' SAPDP.md
}

sapdp_registry_records() {
  awk '
    /^<!-- Authority Registry Start -->$/ { active = 1; next }
    /^<!-- Authority Registry End -->$/ { active = 0 }
    active && /^authority\|/ {
      if (split($0, fields, "|") != 5) exit 2
      print fields[2] "|" fields[3] "|" fields[4] "|" fields[5]
    }
  ' SAPDP.md
}

sapdp_authority_path() {
  local kind=$1 owner=$2 component=$3
  sapdp_registry_records | awk -F'|' \
    -v kind="$kind" -v owner="$owner" -v component="$component" '
      $1 == kind && $2 == owner && $3 == component {
        print $4
        count++
      }
      END { if (count != 1) exit 2 }
    '
}

sapdp_dependency_records() {
  awk '
    /^<!-- SAPDP Authority Metadata Start -->$/ { active = 1; next }
    /^<!-- SAPDP Authority Metadata End -->$/ { active = 0 }
    active && /^depends_on=/ {
      sub(/^depends_on=/, "")
      print
    }
  ' "$1"
}

sapdp_stage_records() {
  sed -n 's/^stage_authority=//p' "$1"
}

sapdp_runtime_capsule() {
  awk '
    /^<!-- Runtime Capsule Start -->$/ { starts++; active = 1 }
    active { print }
    /^<!-- Runtime Capsule End -->$/ { ends++; active = 0 }
    END {
      if (starts != 1 || ends != 1 || active) exit 2
    }
  ' SAPDP.md
}

sapdp_validate_capsule() (
  local capsule_tmp
  capsule_tmp=$(mktemp)
  trap 'rm -f "$capsule_tmp"' EXIT
  sapdp_runtime_capsule >"$capsule_tmp" || return 1
  [[ $(grep -c '^capsule_schema=sapdp-runtime-capsule-v1$' "$capsule_tmp") -eq 1 ]] || return 1
  [[ $(wc -c <"$capsule_tmp" | tr -d ' ') -le 4096 ]] || return 1
  grep -qx 'undefined=NOT DEFINED IN SAPDP.md' "$capsule_tmp" || return 1
)

sapdp_authority_digest() {
  local path
  {
    printf '%s\n' SAPDP.md
    sapdp_registry_paths
  } | LC_ALL=C sort -u | while IFS= read -r path; do
    printf '%s\0' "$path"
    if [[ $path == SAPDP.md ]]; then
      sed '/^Authority Digest:/d' "$path"
    else
      command cat "$path"
    fi
    printf '\0'
  done | sha256_stdin
}

sapdp_validate_registry() (
  local registry_tmp paths_tmp path kind owner component expected
  registry_tmp=$(mktemp)
  paths_tmp=$(mktemp)
  trap 'rm -f "$registry_tmp" "$paths_tmp"' EXIT

  awk '
    /^<!-- Authority Registry Start -->$/ { starts++; active = 1; next }
    /^<!-- Authority Registry End -->$/ { ends++; active = 0; next }
    active && /^authority\|/ {
      if (split($0, f, "|") != 5) exit 2
      print f[2] "|" f[3] "|" f[4] "|" f[5]
    }
    END {
      if (starts != 1 || ends != 1 || active) exit 3
    }
  ' SAPDP.md >"$registry_tmp" || return 1

  [[ -s $registry_tmp ]] || return 1
  [[ $(LC_ALL=C sort "$registry_tmp" | uniq -d | wc -l | tr -d ' ') -eq 0 ]] || return 1

  cut -d'|' -f4 "$registry_tmp" >"$paths_tmp"
  [[ $(LC_ALL=C sort "$paths_tmp" | uniq -d | wc -l | tr -d ' ') -eq 0 ]] || return 1

  while IFS='|' read -r kind owner component path; do
    [[ $path != /* && $path != *'..'* && $path != .git/* ]] || return 1
    [[ -f $path && ! -L $path ]] || return 1
    grep -qx 'authority=normative' "$path" || return 1
    grep -qx "kind=$kind" "$path" || return 1
    grep -qx "owner_id=$owner" "$path" || return 1
    grep -qx "component_id=$component" "$path" || return 1
    grep -qx 'schema=sapdp-authority-v1' "$path" || return 1
  done <"$registry_tmp"

  expected=$(grep -RIl '^authority=normative$' protocol | LC_ALL=C sort)
  [[ $expected == "$(LC_ALL=C sort "$paths_tmp")" ]] || return 1
)

sapdp_validate_dependencies() (
  local edges source kind owner component dependency path
  edges=$(mktemp)
  trap 'rm -f "$edges"' EXIT

  while IFS='|' read -r kind owner component path; do
    source="${kind}|${owner}|${component}"
    if [[ -n $(sapdp_dependency_records "$path" | LC_ALL=C sort | uniq -d) ]]; then
      return 1
    fi
    while IFS= read -r dependency; do
      [[ -n $dependency ]] || continue
      [[ $dependency =~ ^[^|]+\|[^|]+\|[^|]+$ ]] || return 1
      IFS='|' read -r kind owner component <<<"$dependency"
      sapdp_authority_path "$kind" "$owner" "$component" >/dev/null || return 1
      [[ $source != "$dependency" ]] || return 1
      printf '%s %s\n' "$source" "$dependency" >>"$edges"
    done < <(sapdp_dependency_records "$path")
  done < <(sapdp_registry_records)

  if [[ -s $edges ]]; then
    tsort "$edges" >/dev/null 2>&1 || return 1
  fi
)

sapdp_validate_stage_authority() (
  local core expected records stage kind owner component path
  core=$(sapdp_authority_path flow protocol-evolution main) || return 1
  records=$(mktemp)
  expected=$(mktemp)
  trap 'rm -f "$records" "$expected"' EXIT

  sapdp_stage_records "$core" >"$records"
  cat >"$expected" <<'EOF'
1|flow|protocol-evolution|evolution-definition
2|flow|protocol-evolution|design
3|flow|protocol-evolution|design-audit
4|flow|protocol-evolution|design-freeze
5|flow|protocol-evolution|materialization
6|flow|protocol-evolution|repository-audit
7|flow|protocol-evolution|release
EOF
  cmp -s "$expected" "$records" || return 1

  while IFS='|' read -r stage kind owner component; do
    path=$(sapdp_authority_path "$kind" "$owner" "$component") || return 1
    [[ -f $path && ! -L $path ]] || return 1
  done <"$records"
)

sapdp_context_closure_records() (
  local flow=$1 stage=$2 queue seen record kind owner component path dependency
  queue=$(mktemp)
  seen=$(mktemp)
  trap 'rm -f "$queue" "$seen"' EXIT

  printf 'flow|%s|main\n' "$flow" >"$queue"
  if [[ $flow == protocol-evolution ]]; then
    path=$(sapdp_authority_path flow protocol-evolution main) || return 1
    record=$(sapdp_stage_records "$path" | awk -F'|' -v stage="$stage" '
      $1 == stage { print $2 "|" $3 "|" $4; count++ }
      END { if (count != 1) exit 2 }
    ') || return 1
    printf '%s\n' "$record" >>"$queue"
  fi

  while IFS= read -r record || [[ -n $record ]]; do
    [[ -n $record ]] || continue
    grep -Fxq "$record" "$seen" && continue
    printf '%s\n' "$record" >>"$seen"
    IFS='|' read -r kind owner component <<<"$record"
    path=$(sapdp_authority_path "$kind" "$owner" "$component") || return 1
    while IFS= read -r dependency; do
      [[ -n $dependency ]] && printf '%s\n' "$dependency" >>"$queue"
    done < <(sapdp_dependency_records "$path")
  done <"$queue"

  LC_ALL=C sort "$seen"
)

sapdp_context_authority_envelopes() {
  local flow=$1 stage=$2 record kind owner component path blob
  while IFS= read -r record; do
    IFS='|' read -r kind owner component <<<"$record"
    path=$(sapdp_authority_path "$kind" "$owner" "$component") || return 1
    blob=$(git hash-object "$path") || return 1
    printf 'authority_begin=%s|%s|%s|%s|%s\n' "$kind" "$owner" "$component" "$path" "$blob"
    command cat "$path"
    [[ $(tail -c 1 "$path" | wc -l | tr -d ' ') -eq 1 ]] || printf '\n'
    printf 'authority_end=%s|%s|%s\n' "$kind" "$owner" "$component"
  done < <(sapdp_context_closure_records "$flow" "$stage")
}

sapdp_validate_context_budgets() {
  local path bundle result=0
  [[ $(wc -c <protocol/flows/protocol-evolution.md | tr -d ' ') -le 3072 ]] || return 1
  for path in protocol/flows/protocol-evolution/*.md; do
    [[ $(wc -c <"$path" | tr -d ' ') -le 4096 ]] || return 1
  done
  bundle=$(mktemp)
  {
    printf 'SAPDP_CONTEXT_V1\n'
    printf 'ref=%040d\n' 0
    printf 'root_blob=%040d\n' 0
    printf 'version=v0.0.0\n'
    printf 'authority_digest=sha256:%064d\n' 0
    printf 'flow=protocol-evolution\n'
    printf 'stage=1\n'
    printf 'working_tree=dirty\n'
    printf 'remote_main=%040d\n' 0
    sapdp_context_authority_envelopes protocol-evolution 1
    printf 'END_SAPDP_CONTEXT\n'
  } >"$bundle" || {
    rm -f "$bundle"
    return 1
  }
  [[ $(wc -c <"$bundle" | tr -d ' ') -le 16384 ]] || result=1
  rm -f "$bundle"
  return "$result"
}

sapdp_validate_authority() {
  local declared calculated
  sapdp_heading_version >/dev/null || return 1
  sapdp_validate_capsule || return 1
  sapdp_validate_registry || return 1
  sapdp_validate_dependencies || return 1
  sapdp_validate_stage_authority || return 1
  sapdp_validate_context_budgets || return 1

  declared=$(sed -n 's/^Authority Digest: sha256://p' SAPDP.md)
  [[ $declared =~ ^[0-9a-f]{64}$ ]] || return 1
  calculated=$(sapdp_authority_digest)
  [[ $declared == "$calculated" ]]
}

sapdp_freeze_payload() {
  local freeze_file=$1
  awk '
    /^<!-- Frozen Payload Start -->$/ { starts++; active = 1; next }
    /^<!-- Frozen Payload End -->$/ { ends++; active = 0; next }
    active { print }
    END {
      if (starts != 1 || ends != 1 || active) exit 2
    }
  ' "$freeze_file"
}

sapdp_freeze_digest() {
  sapdp_freeze_payload "$1" | sha256_stdin
}

sapdp_freeze_value() {
  local freeze_file=$1 key=$2
  sapdp_freeze_payload "$freeze_file" | awk -F= -v key="$key" '
    $1 == key {
      sub(/^[^=]*=/, "")
      print
      count++
    }
    END { if (count != 1) exit 2 }
  '
}

sapdp_freeze_values() {
  local freeze_file=$1 key=$2
  sapdp_freeze_payload "$freeze_file" | awk -F= -v key="$key" '
    $1 == key {
      sub(/^[^=]*=/, "")
      print
    }
  '
}

sapdp_validate_freeze() {
  local freeze_file=$1 expected=$2 declared calculated target path previous= snapshot snapshot_digest
  [[ $freeze_file != /* && $freeze_file != *'..'* && $freeze_file != .git/* ]] || return 1
  [[ -f $freeze_file && ! -L $freeze_file ]] || return 1
  [[ $expected =~ ^sha256:[0-9a-f]{64}$ ]] || return 1

  declared=$(sed -n 's/^Freeze Digest: //p' "$freeze_file")
  [[ $(grep -c '^Freeze Digest: sha256:[0-9a-f]\{64\}$' "$freeze_file") -eq 1 ]] || return 1
  calculated="sha256:$(sapdp_freeze_digest "$freeze_file")" || return 1
  [[ $declared == "$expected" && $calculated == "$expected" ]] || return 1

  sapdp_freeze_value "$freeze_file" base_commit_sha | grep -Eq '^[0-9a-f]{40}$' || return 1
  sapdp_freeze_value "$freeze_file" current_version | grep -Eq '^v[0-9]+\.[0-9]+\.[0-9]+$' || return 1
  target=$(sapdp_freeze_value "$freeze_file" target_version) || return 1
  [[ $target =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]] || return 1
  [[ $freeze_file == "docs/history/protocol-evolution/${target}/design-freeze.md" ]] || return 1
  sapdp_freeze_value "$freeze_file" runtime_baseline_digest | grep -Eq '^sha256:[0-9a-f]{64}$' || return 1
  [[ $(sapdp_freeze_value "$freeze_file" dependency_schema) == sapdp-authority-dependency-v2 ]] || return 1
  [[ $(sapdp_freeze_value "$freeze_file" runtime_capsule_schema) == sapdp-runtime-capsule-v1 ]] || return 1
  [[ $(sapdp_freeze_value "$freeze_file" context_schema) == sapdp-context-v1 ]] || return 1
  sapdp_freeze_value "$freeze_file" commit_message | grep -Eq '[[:graph:]]' || return 1

  snapshot=$(sapdp_freeze_value "$freeze_file" findings_snapshot_path) || return 1
  snapshot_digest=$(sapdp_freeze_value "$freeze_file" findings_snapshot_digest) || return 1
  [[ $snapshot != /* && $snapshot != *'..'* && $snapshot != .git/* ]] || return 1
  [[ -f $snapshot && ! -L $snapshot ]] || return 1
  [[ $snapshot_digest =~ ^sha256:[0-9a-f]{64}$ ]] || return 1
  [[ $snapshot_digest == "sha256:$(sapdp_sha256_file "$snapshot")" ]] || return 1
  ! grep -qx 'OPEN' "$snapshot" || return 1

  while IFS= read -r path; do
    [[ -n $path && $path != /* && $path != *'..'* && $path != .git/* ]] || return 1
    [[ $path != "$previous" ]] || return 1
    if [[ -n $previous && $path < $previous ]]; then
      return 1
    fi
    previous=$path
  done < <(sapdp_freeze_values "$freeze_file" frozen_file)

  sapdp_freeze_values "$freeze_file" frozen_file | grep -qx "$freeze_file" || return 1
}

sapdp_changed_paths() {
  {
    git diff --name-only --no-renames
    git diff --cached --name-only --no-renames
    git ls-files --others --exclude-standard
  } | LC_ALL=C sort -u
}

sapdp_commit_paths() {
  local base=$1 commit=$2
  git diff --name-only --no-renames "$base" "$commit" | LC_ALL=C sort -u
}
