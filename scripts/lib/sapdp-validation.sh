#!/usr/bin/env bash

export LC_ALL=C
export LC_CTYPE=C
export LANG=C

sha256_stdin() {
  LC_ALL=C LC_CTYPE=C LANG=C shasum -a 256 | awk '{print $1}'
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

sapdp_validate_authority() {
  local declared calculated
  sapdp_heading_version >/dev/null || return 1
  [[ $(grep -c '^<!-- Runtime Summary Start -->$' SAPDP.md) -eq 1 ]] || return 1
  [[ $(grep -c '^<!-- Runtime Summary End -->$' SAPDP.md) -eq 1 ]] || return 1
  sapdp_validate_registry || return 1

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
  local freeze_file=$1 expected=$2 declared calculated target path previous=
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
  sapdp_freeze_value "$freeze_file" commit_message | grep -Eq '[[:graph:]]' || return 1

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
