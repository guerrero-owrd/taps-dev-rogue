# Dev Logging Rules for `taps-dev-rogue`

## Purpose

This file defines the minimum logging rules for technical work carried out in
`taps-dev-rogue`.

These rules are intended to:

- support reproducible technical work,
- keep technical records consistent,
- reduce cross-tracking drift between repos,
- and make it easier to reconcile dev work back into `taps-proj-mgmt`.

This file does not replace the authoritative management-side logging rules.
Project-facing decisions, risks, and management synthesis still live in
`taps-proj-mgmt`.

---

## 1. Repo role

`taps-dev-rogue` is the technical development repo.

It is used for:

- technical notes
- continuous tech-tracking logs
- staged POC inputs
- scripts and build logic
- draft technical outputs
- local AI session logging for dev work

It is not the authoritative home for:

- formal management session notes
- formal decision logs
- formal risk logs
- project-level progress interpretation

Those remain in `taps-proj-mgmt`.

---

## 2. Core logging principle

Technical work should be logged in a way that preserves:

- provenance
- reproducibility
- scope awareness
- escalation visibility
- clean cross-links back to management records

If technical work is not logged in the repo, it should not be treated as
operationally reliable.

---

## 3. Main logging artifacts in this repo

### A. Tech notes

Location:

`2-processes/21-production-hub/tech-notes/YYYY/YYYY-MM/`

Purpose:

- record technical execution details for a work block or session
- document files touched, scripts revised, checks run, assumptions, blockers,
  outputs, and technical observations
- classify technical actions into:
  - within scope
  - escalation-triggering

### B. Tech tracking logs

Location:

`2-processes/21-production-hub/tech-tracking/`

Purpose:

- store continuous CSV logs for:
  - within-scope technical choices
  - escalation-triggering issues
  - weekly development status and rollover

These logs are continuous and are not organized by month.

### C. AI session register

Location:

`2-processes/21-production-hub/reports/ai_session_register.csv`

Purpose:

- record dev-side AI sessions used for technical work in this repo
- point to the saved transcript path in `4-memory/41-archive/`

---

## 4. Notes versus logs

### Tech notes

Tech notes are narrative technical records.

Use them for:

- implementation detail
- technical context
- failed attempts
- caveats
- validation results
- output description

Tech notes use `.md` files and must remain YAML-free.

Each tech note must have a paired `.meta.yml` sidecar with the same basename.

### Tech tracking logs

Tech tracking logs are structured CSV control records.

Use them for:

- technical choices that stayed within scope
- issues that triggered escalation
- weekly status and rollover

If it reads like a control table or register, it belongs in `tech-tracking`.

---

## 5. Monthly versus continuous organization

Use monthly folders for:

- tech notes

Use continuous files for:

- tech tracking CSVs
- AI session register

Rule:

- notes are monthly-grouped
- logs are continuous

---

## 6. Active scope rule

Technical work in this repo should proceed under one active scoping note at a
time for the relevant workstream.

The active scoping note:

- lives in `taps-proj-mgmt`
- is added as a source to the dev workspace
- defines what is in scope
- defines what triggers escalation

Do not duplicate scoping notes in this repo.

---

## 7. Cross-linking rule

When a tech note is created, link it back to:

- the related management note
- the related scoping note
- relevant outputs
- relevant commits
- relevant tracking-log entries

When a technical issue crosses the escalation boundary, reflect it back into
the management workflow rather than resolving it silently here.

---

## 8. Tech tracking logs required in this repo

The following CSV logs are maintained in:

`2-processes/21-production-hub/tech-tracking/`

### `tech_scope_choices.csv`

Use for technical choices that remained within scope.

### `tech_escalations.csv`

Use for issues or choices that triggered escalation.

### `tech_weekly_status.csv`

Use for weekly work status, blockers, outputs, and rollover items.

These logs support management synthesis but do not replace formal decision or
risk logs.

---

## 9. AI session register schema

File:

`2-processes/21-production-hub/reports/ai_session_register.csv`

Header:

`seq,id,date,tool,short_summary,tags,transcript_path,transcript_exists,related_scope_id,related_tech_note`

Rules:

- no commas inside narrative fields
- use semicolons inside `tags`
- booleans must be `TRUE` or `FALSE`
- all dates use `YYYY-MM-DD`
- paths must be real repo-relative paths
- IDs must be unique

Saved transcripts should live in:

`4-memory/41-archive/chat-transcripts/`

---

## 10. Dev time tracking and efficiency baseline

### Purpose of efficiency tracking

Use a separate dev-side time tracker to record efficiency for technical work in
`taps-dev-rogue`.

This tracker exists because development efficiency is not the same as
management-side efficiency. Dev work often includes:

- scripting
- debugging
- geospatial preprocessing
- data staging
- troubleshooting
- validation
- iterative build work

For that reason, dev efficiency should be tracked in its own file rather than
reusing the management-side `staff_time.csv` structure unchanged.

### File location

`2-processes/21-production-hub/reports/dev_time_tracker.csv`

### Function

This file records session-level or work-block-level dev effort using:

- actual assisted time
- conservative manual estimate for the same work without AI
- computed efficiency gain
- links back to the active scope and related tech note

### Schema

Header:

`dev_time_id,date,person,activity,assisted_hours,manual_est_hours,efficiency_gain,related_scope_id,related_tech_note,notes,logged_mode`

### Field rules

- `dev_time_id` uses the format: `DT-YYYYMMDD-###`
- `date` uses `YYYY-MM-DD`
- `person` is the person performing the work
- `activity` is a short label with no commas
- `assisted_hours` is the actual tracked time for the dev work block
- `manual_est_hours` is a conservative estimate of the same work without AI
- `efficiency_gain` is calculated as:

  `1 - assisted_hours / manual_est_hours`

- `related_scope_id` links the work to the active scoping note
- `related_tech_note` is the repo-relative path to the paired tech note
- `notes` is a short explanation with no commas
- `logged_mode` must be `on-time` or `retrospective`

### Example row

`DT-20260423-001,2026-04-23,FJG,TWIG 2 POC input staging and build setup,3.2,6.5,0.5077,TS-20260422-001,2-processes/21-production-hub/tech-notes/2026/2026-04/2026-04-23_twig2-poc-input-staging.md,Conservative estimate for staging scripting and troubleshooting,on-time`

### Use rule

Create a dev time entry when:

- a substantive dev session occurred
- assisted time can be estimated credibly
- a conservative manual estimate can be stated without exaggeration

Do not create entries for sessions that only established scaffolding,
templates, or planning logic unless the session is being treated as a true dev
work block.

### Interpretation rule

Efficiency values in this file are local dev-side estimates used for internal
comparison across technical work sessions.

They do not replace formal staff-time logging in `taps-proj-mgmt` and should
not be treated as official project staffing records.

### Practical principle

Use this tracker to support realistic comparison across technical sessions.

Keep estimates conservative.
Do not inflate gains.
Do not log fictional precision.

---

## 10. ID conventions

### Tech note

`TN-YYYYMMDD-###`

### Tech scoping note

Managed in `taps-proj-mgmt`:
`TS-YYYYMMDD-###`

### Tech Tracking Logs Entry Conventions

- `TC-YYYYMMDD-###` = within-scope technical choice
- `TE-YYYYMMDD-###` = escalation-triggering issue
- `TW-YYYYMMDD-###` = weekly status entry

### AI session register

Use the project-wide AI session ID convention:

`{tool-prefix}-taps-dev-XXX`

Examples:

- `cgpt-taps-dev-127`
- `copt-taps-dev-128`

---

## 11. Escalation rule

Escalate back to management when technical work affects:

- source meaning
- schema assumptions
- linkage logic
- provenance clarity
- reproducibility
- cross-domain interpretation
- TWIG-facing framing
- whether a component must be deferred or reframed

Technical logs in this repo should surface such issues, not bury them.

---

## 12. Session-close minimum checklist

Before closing a substantive dev work block, confirm:

- [ ] tech note exists if substantive technical work occurred
- [ ] paired `.meta.yml` exists
- [ ] relevant tracking logs were updated if entries were generated
- [ ] AI session register was updated if an AI session was used
- [ ] commits are linked in the tech note or sidecar
- [ ] related management note and scoping note are referenced
- [ ] escalation-triggering items are clearly marked for management follow-up

---

## 13. Practical principle

Use the minimum logging needed to preserve reproducibility, scope discipline,
and reconciliation with management.

Do not duplicate management logs here.
Do not create parallel governance records in the dev repo.
Do not let technical work proceed without a visible scope boundary.
