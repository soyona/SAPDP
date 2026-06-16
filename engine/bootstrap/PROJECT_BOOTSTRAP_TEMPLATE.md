# PROJECT_BOOTSTRAP_TEMPLATE

## Purpose

Template for Bootstrap metadata in a SAPDP Product Repository.

`PROJECT_BOOTSTRAP.md` records Bootstrap identity, source, and scaffold metadata.

`PROJECT_STATE.md` is the authoritative lifecycle state source.

---

## Bootstrap Initial Values

Project Name: <PRODUCT_NAME>

Detected Protocol Version: <RESOLVED_PROTOCOL_VERSION>

Latest Stable Version: <LATEST_STABLE_VERSION>

Protocol Source: https://github.com/soyona/SAPDP.git

Bootstrap Status: PASS

Current Lifecycle Stage: Problem

Current Goal: Define validated problem worth solving

Current Task: Create ProblemDefinition_CORE_v1.md

Required Load Set:
    PROJECT_STATE.md
    PROJECT_BOOTSTRAP.md
    ARTIFACT_INDEX.md
    ROUTE_MANIFEST.md
    docs/protocol/SAPDP_CANONICAL_PROTOCOL.md

Next Action: Create ProblemDefinition_CORE_v1.md

Current Blockers: None

Last Updated: <TIMESTAMP>

---

## Authority

PROJECT_STATE.md is the Lifecycle State Authority.

PROJECT_BOOTSTRAP.md is the Bootstrap Metadata Authority.

Other Bootstrap artifacts must not redefine lifecycle state values.

Protocol Version must match PROJECT_STATE.md.

`latest` must not be persisted as the resolved Protocol Version.

Version mismatch between Bootstrap metadata and PROJECT_STATE.md means BLOCKED.

ROUTE_MANIFEST.md is the Route Manifest Authority.

PROJECT_BOOTSTRAP.md may reference ROUTE_MANIFEST.md but does not duplicate route metadata.

---

## Notes

This template does not include:

    Problem Definition

    Solution Definition

    MVP Definition

    Task Package

    Build Status

    Release Status

---

## Status

Frozen Candidate


## Runtime Navigation

Lifecycle Progress UI must use the canonical symbols:

```text
● for the current stage
○ for inactive stages
```

```text
Lifecycle Progress

● Problem                    CURRENT

○ Solution

○ Product Representation

○ Product Requirement

○ UX Specification

○ Visual Design Specification

○ MVP Definition

○ Task Package

○ Build

○ Implementation Verification

○ User Validation

○ Release
```


```
