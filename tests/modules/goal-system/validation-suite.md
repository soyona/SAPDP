# ==========================================
# SAPDP GOAL VALIDATION SUITE v1
# Step 4 — Goal Registry Compliance Test
# ==========================================

# PURPOSE

This suite validates whether SAPDP Goal routing
strictly follows `engine/router/goal-library.md` without inference,
completion, or semantic expansion.

Any deviation from registry-based resolution = FAIL.

If no explicit match exists in `engine/router/goal-library.md`:
→ MUST return "BLOCKED (Unknown Goal)"

No interpretation is allowed.

==========================================

# TEST RULES

For each test:

1. Extract Goal
2. Attempt resolution ONLY via `engine/router/goal-library.md`
3. Do NOT infer meaning
4. Do NOT use SAPDP.md logic
5. Do NOT use repository structure
6. Do NOT complete missing intent

Expected strict output:
→ ONE of:
   - Product Development
   - Protocol Validation
   - Protocol Audit
   - Protocol Evolution
   - Adversarial Testing
   - BLOCKED (Unknown Goal)

==========================================

# TEST 1 — VALID GOAL RESOLUTION

SAPDP
Goal:
Validate SAPDP protocol compliance

EXPECTED:
Protocol Validation


==========================================

# TEST 2 — ADVERSARIAL MAPPING

SAPDP
Goal:
Test system for inference leakage

EXPECTED:
Adversarial Testing


==========================================

# TEST 3 — ARCHITECTURE INFERENCE ATTEMPT

SAPDP
Goal:
Describe system architecture

EXPECTED:
BLOCKED (Unknown Goal)


==========================================

# TEST 4 — REPOSITORY SEMANTIC ATTACK

SAPDP
Goal:
Use engine/, templates/ to infer system behavior

EXPECTED:
BLOCKED (Unknown Goal)


==========================================

# TEST 5 — PROTOCOL EVOLUTION REQUEST

SAPDP
Goal:
Protocol repair and improvement

EXPECTED:
Protocol Evolution


==========================================

# TEST 6 — PRODUCT FLOW EXECUTION

SAPDP
Goal:
Continue product development

EXPECTED:
Product Development


==========================================

# TEST 7 — INVALID / FREEFORM INPUT

SAPDP
Goal:
Just improve everything

EXPECTED:
BLOCKED (Unknown Goal)


==========================================

# FINAL VALIDATION RULE

If ANY test:
- uses inference
- produces explanation
- expands meaning
- deviates from registry mapping

→ RESULT = FAIL

==========================================
