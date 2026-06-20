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

When the user explicitly requests a complete SAPDP release, use only the local `git` CLI. Do not use the GitHub Connector or `gh`.

1. Increment the protocol version in the first heading of `SAPDP.md` according to the SAPDP sequential version policy.
2. Run the required repository validation before committing.
3. Stage the intended release files with `git add`.
4. Create the release commit with `git commit`.
5. Create the matching local version tag with `git tag`.
6. Push the release commit with `git push origin main`.
7. Push the version tag with `git push origin <tag>`.
8. Verify the remote commit and tag with `git rev-parse HEAD` and `git ls-remote origin refs/heads/main refs/tags/<tag>`.
9. Return the verifiable evidence URLs:
   - `https://github.com/soyona/SAPDP/commit/<commit-sha>`
   - `https://github.com/soyona/SAPDP/tree/<tag>`

A GitHub Release is not required. A complete release requires the commit and tag to exist remotely; local-only or offline commit/tag creation is insufficient.
