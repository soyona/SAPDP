#!/usr/bin/env bash

set -euo pipefail

python3 - <<'PY'
import hashlib
import json
import pathlib
import subprocess

manifest = json.loads(pathlib.Path(
    "tests/compatibility/authority-migration-map.json"
).read_text())

source_ref = manifest["source_ref"]
source_commit = manifest["source_commit"]
resolved = subprocess.check_output(
    ["git", "rev-list", "-n", "1", source_ref],
    text=True,
).strip()
if resolved != source_commit:
    raise SystemExit("source ref does not resolve to frozen source commit")

seen = set()
for source in manifest["sources"]:
    path = source["path"]
    if path in seen:
        raise SystemExit(f"duplicate migration source: {path}")
    seen.add(path)

    content = subprocess.check_output(["git", "show", f"{source_ref}:{path}"])
    digest = hashlib.sha256(content).hexdigest()
    if digest != source["sha256"]:
        raise SystemExit(f"source digest mismatch: {path}")

    targets = source.get("targets", [])
    if not targets:
        raise SystemExit(f"source has no migration target: {path}")
    for target in targets:
        if not pathlib.Path(target).is_file():
            raise SystemExit(f"migration target missing: {target}")

    if source.get("preserve_headings"):
        source_headings = {
            line for line in content.decode().splitlines()
            if line.startswith("## ")
        }
        target_text = "\n".join(
            pathlib.Path(target).read_text() for target in targets
        )
        missing = sorted(source_headings - set(target_text.splitlines()))
        if missing:
            raise SystemExit(
                f"migration headings missing for {path}: {missing}"
            )

required_sources = {
    "SAPDP.md",
    "AGENTS.md",
    "DEVELOPER.md",
    "engine/contracts/ArtifactMaterializationContract.md",
    "engine/contracts/BootstrapContract.md",
    "engine/contracts/BootstrapValidationContract.md",
    "engine/contracts/ExecutionGovernanceContract.md",
    "engine/contracts/ProtocolEvolutionCompletionContract.md",
    "docs/dna/DNA_ARCHITECTURE_DESIGN.md",
    "docs/goal-system/GOAL_SYSTEM_V1_FREEZE.md",
    "docs/goal-system/GOAL_SYSTEM_V1_RELEASE.md",
}
if seen != required_sources:
    raise SystemExit("migration source coverage is incomplete")
PY
