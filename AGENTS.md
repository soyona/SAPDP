# SAPDP Loader

Trigger only when the user's first non-empty line is `SAPDP`. Trim surrounding whitespace and compare case-insensitively.

Quoted, referenced, discussed, or example occurrences do not trigger loading.

When triggered:

1. Verify `git remote get-url origin` is `https://github.com/soyona/SAPDP`.
2. Run `git fetch origin main`.
3. Run `git rev-parse FETCH_HEAD:SAPDP.md`.
4. Compare the resulting blob SHA with the SAPDP SHA loaded in this session.
5. If unchanged, do not reload the root authority.
6. If changed or not loaded, run `git show FETCH_HEAD:SAPDP.md`.
7. Replace prior SAPDP root context with the retrieved file.
8. Hand control to the loaded `SAPDP.md` runtime without user-visible loader output.

The Loader performs repository fetch, root context reset, and root authority retrieval only.

The Loader must not:

- define protocol behavior;
- route Goals;
- derive lifecycle or Flow rules;
- inspect repository structure for semantics;
- load an unregistered authority;
- modify the working tree;
- produce status, confirmation, or transition output.

After root loading, `SAPDP.md` resolves and loads registered Flow and Module authorities from the same `FETCH_HEAD` Git ref.

If this file conflicts with `SAPDP.md`, the loaded root authority governs protocol behavior.
