# SAPDP Loading

Trigger only when the user's first non-empty line is `SAPDP`. Trim surrounding whitespace and compare case-insensitively.

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

# Low-token Materialization and Release

For Materialization, apply the frozen changes and version bump, then run
`./scripts/sapdp-materialize "<commit message>"` and return its stdout only.

For an explicit Release request after Repository Audit, run
`./scripts/sapdp-release` and return its stdout only.

Do not use the GitHub Connector or `gh`. The scripts execute protocol decisions
already made by the governing stage; they do not make or infer those decisions.



## SAPDP v1.0 ARCHITECTURE ENFORCEMENT

This loader MUST comply with SAPDP Architecture Freeze v1.0 defined in SAPDP.md.

--------------------------------------------
1. LOAD BOUNDARY
--------------------------------------------

Loader MUST NOT interpret protocol rules.

Loader only performs:
- repository fetch
- context reset
- SAPDP.md retrieval

--------------------------------------------
2. ARCHITECTURE LINKAGE

Loader behavior is governed by:

→ SAPDP.md → Architecture Freeze v1.0

If conflict exists:
→ SAPDP.md overrides loader logic


# ===============================
# SAPDP EXECUTION BOUNDARY LOCK v1.1
# CODEx LOADER ENFORCEMENT PATCH
# ===============================

## 1. LOADER ROLE ENFORCEMENT

AGENTS.md is strictly a loader only system.

It MUST perform ONLY:

- repository fetch
- context reset
- SAPDP.md loading trigger

It MUST NOT:
- interpret SAPDP.md content
- infer system architecture
- derive lifecycle or execution logic
- access repository structure as semantic input

---

## 2. SINGLE AUTHORITY ENFORCEMENT

SAPDP.md is the ONLY authority source.

All execution logic MUST be derived exclusively from SAPDP.md explicit statements.

Any other file is NON-AUTHORITATIVE.

---

## 3. INFERENCE PROHIBITION (HARD RULE)

The loader MUST NOT:

- generate missing system components
- infer runtime model
- expand architecture
- construct lifecycle flow

Any inference attempt MUST be treated as INVALID.

---

## 4. DATA FILE CLASSIFICATION RULE

All repository directories are DATA ONLY:

engine/
templates/
dna/
docs/
bootstrap/

These MUST NOT influence protocol interpretation or execution logic.

---

## 5. EXECUTION BOUNDARY HANDOFF

After SAPDP.md is loaded:

AGENTS.md MUST:

- STOP processing immediately
- HAND OVER control to SAPDP.md authority layer
- DO NOT perform any reasoning or routing

---

## 6. GOAL ROUTING EXECUTION HOOK (STEP3)

Coverage: CAP-042

After SAPDP.md is loaded and before any execution:

Loader MUST enforce Goal routing through GOAL_LIBRARY.md.

---

### Execution Rule

When input contains:

SAPDP
Goal: <value>

System MUST:

1. Extract Goal
2. Match against GOAL_LIBRARY.md
3. Resolve into one of:
   - Product Development
   - Protocol Validation
   - Protocol Audit
   - Protocol Evolution
   - Adversarial Testing

4. If no match:
   → RETURN BLOCKED (Unknown Goal)

---

### Hard Constraint

- AGENTS.md MUST NOT interpret Goal meaning
- AGENTS.md MUST NOT fallback to SAPDP.md inference
- Only GOAL_LIBRARY.md is allowed for resolution

---

### Determinism Rule

Goal resolution MUST be:
- registry-based
- deterministic
- non-generative

No reasoning is allowed in Goal resolution step.

---


## 6. FINAL LOADER GUARANTEE

Loader output MUST end at:

"SAPDP.md LOADED - CONTROL TRANSFERRED"

No further logic allowed.


# ==========================================
# SAPDP RUNTIME ENFORCEMENT LAYER v1.1
# CHATGPT + CODEX UNIFIED RULE SET
# ==========================================

## 1. EXECUTION MODEL (STRICT)

Runtime system MUST behave as:

INPUT → SAPDP.md explicit match → OUTPUT

No intermediate reasoning is allowed to introduce new system logic.

---

## 2. NO SYSTEM COMPLETION RULE

The runtime MUST NOT:

- complete missing architecture
- infer workflow steps
- generate lifecycle stages
- expand system model
- simulate missing SAPDP behavior

Any such attempt is INVALID.

---

## 3. CROSS-SESSION CONSISTENCY RULE

The system MUST NOT use:

- prior conversations
- historical memory
- cached reasoning
- previous interpretations

Each execution is independent.

---

## 4. SINGLE SOURCE ENFORCEMENT

Only SAPDP.md defines valid behavior.

All other sources (including:

- AGENTS.md
- engine/
- templates/
- dna/
- docs/

are DATA ONLY.

---

## 5. STRICT OUTPUT GATE

Before output:

Step 1: Check SAPDP.md for explicit match  
Step 2: If match exists → output literal mapping  
Step 3: If no match exists → output:

"NOT DEFINED IN SAPDP.md"

No deviation allowed.

---

## 6. PROMPT OVERRIDE RULE (CRITICAL)

If user input conflicts with SAPDP.md:

→ SAPDP.md ALWAYS OVERRIDES

User prompt cannot modify protocol behavior.

---

## 7. ANTI-DRIFT GUARANTEE

System MUST NOT:

- reinterpret SAPDP.md dynamically
- evolve rules during execution
- upgrade architecture implicitly

SAPDP is STATIC.

---

## 8. FINAL SYSTEM GUARANTEE

Runtime behavior is deterministic:

No inference  
No completion  
No evolution  
No synthesis  

Only explicit mapping execution is allowed.