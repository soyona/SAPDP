# SAPDP v2 Capability Mapping

| Capability ID | Capability Name | Required in v2 | V2 Target | One-line rationale |
| --- | --- | --- | --- | --- |
| CAP-001 | Invocation and Load Entry | YES | SAPDP.md section 1. Invocation | Runtime startup belongs in the single v2 entry document. |
| CAP-002 | Protocol Version Resolution | YES | SAPDP.md section 2. Bootstrap | Version resolution is a bootstrap-time runtime rule. |
| CAP-003 | Token-Minimal Runtime | YES | SAPDP.md section 12. Token and Context Minimization | Runtime compression and `NEXT_ACTION` output are global token rules. |
| CAP-004 | Product Bootstrap Entry | YES | SAPDP.md section 2. Bootstrap | Bootstrap entry instructions should be consolidated into the v2 bootstrap section. |
| CAP-005 | Bootstrap Contract | YES | contracts/ | Bootstrap execution responsibilities are contract material. |
| CAP-006 | Bootstrap Validation Contract | YES | contracts/ | Bootstrap PASS, PATCH REQUIRED, and FAIL rules are validation contract material. |
| CAP-007 | Bootstrap Manifest Configuration | YES | contracts/ | Scaffold and authority configuration should be represented by v2 bootstrap contracts. |
| CAP-008 | Project Initialization Scaffold | YES | contracts/ | Initialization scaffold behavior is governed by bootstrap contracts. |
| CAP-009 | Bootstrap Idempotency | YES | contracts/ | Non-destructive bootstrap behavior is a contract constraint. |
| CAP-010 | Protocol Snapshot Strategy | YES | contracts/ | Snapshot requirements are bootstrap contract rules. |
| CAP-011 | Lifecycle State Authority | YES | templates/ | `PROJECT_STATE.md` authority is instantiated through the state template. |
| CAP-012 | Current Stage Recovery | YES | SAPDP.md section 4. Current Stage and Next Action | Stage recovery is a core runtime navigation rule. |
| CAP-013 | Next Action Recovery | YES | SAPDP.md section 4. Current Stage and Next Action | Next-action recovery is a core runtime navigation rule. |
| CAP-014 | Transition Contract | YES | contracts/ | Transition checks are lifecycle contract behavior. |
| CAP-015 | Commit-Gated Lifecycle | YES | SAPDP.md section 6. Lifecycle | Commit-gated progression is a lifecycle runtime rule. |
| CAP-016 | Lifecycle Stage Set | YES | SAPDP.md section 6. Lifecycle | The product stage sequence belongs in the lifecycle section. |
| CAP-017 | Lifecycle Entry and Rollback Rules | YES | SAPDP.md section 6. Lifecycle | Entry and rollback behavior defines lifecycle navigation. |
| CAP-018 | Stage Definitions | YES | SAPDP.md section 6. Lifecycle | Stage objectives, inputs, outputs, and owners belong in lifecycle definition. |
| CAP-019 | Route Card | YES | SAPDP.md section 5. Human-AI Handoff | Route Cards are handoff contracts between Human, ChatGPT, Codex, and Git. |
| CAP-020 | Route Manifest | YES | templates/ | `ROUTE_MANIFEST.md` is produced from a template artifact. |
| CAP-021 | ChatGPT to Codex Handoff | YES | SAPDP.md section 5. Human-AI Handoff | Codex task transfer is core handoff behavior. |
| CAP-022 | Codex to ChatGPT Handoff | YES | SAPDP.md section 5. Human-AI Handoff | Codex return format is core handoff behavior. |
| CAP-023 | ChatGPT Project and Session Routing | YES | SAPDP.md section 5. Human-AI Handoff | Project and session rules determine runtime handoff routing. |
| CAP-024 | Human and Git Exception Handoff | YES | SAPDP.md section 5. Human-AI Handoff | Human and Git exception paths are handoff rules. |
| CAP-025 | Artifact Discovery Index | YES | templates/ | `ARTIFACT_INDEX.md` is a generated artifact template. |
| CAP-026 | Artifact Routing Blocks | YES | SAPDP.md section 7. Artifacts | Routing blocks define artifact participation in workflow routing. |
| CAP-027 | Artifact Templates | YES | templates/ | Stage artifact formats must live in v2 templates. |
| CAP-028 | Product Shape Layer | YES | SAPDP.md section 7. Artifacts | Product Shape defines required artifact sequencing before MVP and Build. |
| CAP-029 | Task Package Format | YES | templates/ | Task package structure is a template-defined artifact format. |
| CAP-030 | Implementation Verification | YES | templates/ | Implementation verification output is a template-defined artifact. |
| CAP-031 | User Validation | YES | templates/ | User validation output is a template-defined artifact. |
| CAP-032 | Product Release Result | YES | templates/ | Release result output is a template-defined artifact. |
| CAP-033 | Protocol Release Audit | YES | SAPDP.md section 10. Release | Protocol release PASS requirements belong in release governance. |
| CAP-034 | Protocol Evolution Lifecycle | YES | SAPDP.md section 11. Protocol Evolution | Protocol upgrade routing belongs in protocol evolution. |
| CAP-035 | Git-First Audit Memory | YES | SAPDP.md section 9. Verification and Validation | Git evidence is the default audit and verification source. |
| CAP-036 | MUST/STOP/PASS/FAIL Rules | YES | contracts/ | Mandatory stop and result rules belong in validation contracts. |
| CAP-037 | Lifecycle Progress UI | REVIEW_REQUIRED | REVIEW_REQUIRED | Step 1 marked v2 runtime necessity unclear, so target remains unresolved. |
| CAP-038 | Decision Log Governance | REVIEW_REQUIRED | REVIEW_REQUIRED | Step 1 marked governance versus runtime unclear, so target remains unresolved. |
| CAP-039 | Problem Baseline Governance | REVIEW_REQUIRED | REVIEW_REQUIRED | Step 1 marked normal runtime need unclear, so target remains unresolved. |
| CAP-040 | Foundation and Goals Records | REVIEW_REQUIRED | REVIEW_REQUIRED | Step 1 marked possible distillation need unclear, so target remains unresolved. |
| CAP-041 | Historical Bootstrap Runtime Context | NO | Git history | Historical release state should remain available through repository history. |
| CAP-042 | Historical Research Sequence | NO | Git history | Research path is traceability-only and can remain in history. |
| CAP-043 | Product Marketing Overview | NO | Removed | Marketing overview is not protocol runtime, template, or contract capability. |
