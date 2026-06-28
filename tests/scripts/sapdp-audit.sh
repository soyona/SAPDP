#!/usr/bin/env bash

set -euo pipefail

bash -n scripts/sapdp-audit
grep -Fq 'commit paths do not match Frozen Files' scripts/sapdp-audit
grep -Fq 'remote main does not match candidate' scripts/sapdp-audit
if scripts/sapdp-audit >/dev/null 2>&1; then
  exit 1
fi
