#!/usr/bin/env bash

set -euo pipefail

python3 - <<'PY'
import json
import pathlib
import subprocess

manifest = json.loads(pathlib.Path(
    "tests/compatibility/dependency-migration-v4.0.0.json"
).read_text())

resolved = subprocess.check_output(
    ["git", "rev-list", "-n", "1", manifest["source_ref"]],
    text=True,
).strip()
if resolved != manifest["source_commit"]:
    raise SystemExit("v4.0.0 source ref mismatch")

legacy_count = 0
seen = set()
for record in manifest["records"]:
    path = record["path"]
    if path in seen:
        raise SystemExit(f"duplicate migration path: {path}")
    seen.add(path)

    source = subprocess.check_output(
        ["git", "show", f"{manifest['source_ref']}:{path}"],
        text=True,
    )
    source_dependencies = [
        line.removeprefix("depends_on=")
        for line in source.splitlines()
        if line.startswith("depends_on=")
    ]
    if source_dependencies != record["legacy"]:
        raise SystemExit(f"legacy dependency mismatch: {path}")
    legacy_count += len(source_dependencies)

    current_dependencies = [
        line.removeprefix("depends_on=")
        for line in pathlib.Path(path).read_text().splitlines()
        if line.startswith("depends_on=")
    ]
    if current_dependencies != record["exact"]:
        raise SystemExit(f"exact dependency mismatch: {path}")

if legacy_count != 17:
    raise SystemExit("legacy dependency count is not seventeen")

for path in pathlib.Path("protocol").rglob("*.md"):
    for line in path.read_text().splitlines():
        if line.startswith("depends_on=") and line.count("|") != 2:
            raise SystemExit(f"owner-only dependency remains: {path}")
PY
