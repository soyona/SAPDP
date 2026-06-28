#!/usr/bin/env bash

set -euo pipefail

bash -n scripts/sapdp-release
grep -Fq 'local tag does not match audited release' scripts/sapdp-release
grep -Fq 'remote tag does not match Audited Commit' scripts/sapdp-release
grep -Fq 'Repository-Audit: PASS' scripts/sapdp-release
if scripts/sapdp-release >/dev/null 2>&1; then
  exit 1
fi
