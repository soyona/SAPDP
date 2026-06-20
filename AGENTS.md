# SAPDP Loading

Trigger only when the user's first non-empty line is one of the following active commands. Trim surrounding whitespace and compare case-insensitively:
- 请加载最新SAPDP协议
- reload the latest SAPDP protocol
- 加载SAPDP
- reload SAPDP
- load SAPDP
- SAPDP

Quoted, referenced, discussed, or example occurrences do not trigger loading.

When triggered:

1. Verify `git remote get-url origin` points to `https://github.com/soyona/SAPDP`.
2. Run `git fetch origin main`.
3. Run `git rev-parse FETCH_HEAD:SAPDP.md`.
4. Compare the resulting blob SHA with the SAPDP SHA loaded in this session.
5. If unchanged, do not read the protocol again.
6. If changed or not yet loaded, run `git show FETCH_HEAD:SAPDP.md`.
7. Immediately overwrite all existing SAPDP protocol context and memory with the retrieved protocol.

Do not use the GitHub Connector.
Do not modify the working tree while checking or loading the protocol.
The fetched GitHub `main` version is the sole protocol authority.

# Git-only Release

For an explicit complete-release request, run `./scripts/release patch` and return its stdout only.

Do not use the GitHub Connector or `gh`. The script owns version increment, validation, commit, annotated tag, atomic push, remote verification, and evidence URLs. A GitHub Release is not required.
