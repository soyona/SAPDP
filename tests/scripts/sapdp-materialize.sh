#!/usr/bin/env bash

set -euo pipefail

bash -n scripts/sapdp-materialize scripts/lib/sapdp-validation.sh
grep -Fq 'git add -- "$path"' scripts/sapdp-materialize
! grep -Fq 'git add --all' scripts/sapdp-materialize
grep -Fq 'git push --dry-run' scripts/sapdp-materialize
grep -Fq 'clean HEAD is not a resumable candidate' scripts/sapdp-materialize
grep -Fq 'remote main drifted from Base Commit and candidate' scripts/sapdp-materialize
if scripts/sapdp-materialize >/dev/null 2>&1; then
  exit 1
fi
