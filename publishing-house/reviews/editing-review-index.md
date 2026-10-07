# Editing Review — index.adoc

**File:** `content/modules/ROOT/pages/index.adoc`
**Date:** 2026-10-07
**Reviewer:** AI (rhdp-publishing-house:reviewer-helper)

## Dimension Scores

| Dimension | Score | Findings |
|-----------|-------|----------|
| Structure | 0.90 | 1 |
| Pedagogy | 0.90 | 1 (informational) |
| Style | 0.80 | 3 |
| Technical Accuracy | 0.90 | 1 |
| Formatting | 1.00 | 0 |

## Spec Alignment

| Check | Result |
|-------|--------|
| SA-2: Learning objectives match spec exactly (4/4) | PASS |
| SA-3: Duration — index shows 45 min, spec 0.75 hr | PASS |
| RS-1: Product names accurate | PASS |
| RS-2: Version strings consistent with spec | PASS |

## Findings

### Medium

**[D.6]** "three pre-provisioned hosts" — use numeral per Red Hat style: "3 pre-provisioned hosts" (line 39)

**[D.8]** Em dash bullets (`*satellite.lab* —`) — replace em dash with colon or restructure as definition list (lines 41–43)

### Warning (informational)

**[C.9]** Title capitalises "Hosts" — sentence case: "Manage RHEL Image Mode hosts with Red Hat Satellite"

**[D.10]** Hardcoded "Satellite 6.19" (line 7) and "rhel10/rhel-bootc:10.1" (line 42) — consider `{satellite_version}` and `{bootc_base_image}` attributes in `antora.yml`

## Passed (selected)

- B.8 — 4 learning objectives present
- C.7 — Lists have correct spacing
- C.8 — Document title at correct level (=)
- D.3 — No vague filler terms
- D.5 — No non-inclusive language
- D.9 — No gendered pronouns
