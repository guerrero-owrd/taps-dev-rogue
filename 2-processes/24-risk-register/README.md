# 24-risk-register

**Purpose:** track risks, triggers, probability/impact, mitigations, owners, and review cadence.

## Standing risks (seed list)
- **TSD capacity overrun** → Mitigate with workload reviews; adjust resource allocation.
- **TAP mis-used in regulation** → Permanent “Not for enforcement” banner; briefings; boundary clause.
- **Schema change breaks pipeline** → Versioned code; annual schema check 2 weeks before re-run.
- **Unmanageable feedback from planning groups** → Accept narrative/chart suggestions; exclude changes to TAP development process.
- **Ambitious timeline** → Track staff time; buffer periods; adjust milestones.

## Minimal fields (when you create the CSV)
isk_id, statement, trigger, probability(1–5), impact(1–5), mitigation, owner, status, next_review  
Review quarterly; update 
ext_review.
