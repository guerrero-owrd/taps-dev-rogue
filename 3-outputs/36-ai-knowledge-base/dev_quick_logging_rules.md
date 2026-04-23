# Dev Quick Logging Rules

**Purpose:**  
Fast reference for logging technical work in `taps-dev-rogue` during active
development periods.

Use this file in the dev workspace as the minimum operational guide.

---

## 1. Core split

### `taps-proj-mgmt`

Authoritative home for:

- management notes
- tech scoping notes
- formal decisions
- formal risks
- project-facing progress interpretation

### `taps-dev-rogue`

Home for:

- tech notes
- tech tracking logs
- staged inputs
- scripts
- draft technical outputs
- dev AI session register
- dev time tracker

**Rule:** do not duplicate management logs in the dev repo.

---

## 2. Active scoping rule

Technical work proceeds under **one active scoping note** at a time.

That scoping note:

- lives in `taps-proj-mgmt`
- is added to the dev workspace sources
- defines what is in scope
- defines what triggers escalation

**Do not copy scoping notes into `taps-dev-rogue`.**

---

## 3. Notes vs logs

### Tech notes

Location:

`2-processes/21-production-hub/tech-notes/YYYY/YYYY-MM/`

Use for:

- technical objective
- files and datasets touched
- scripts changed
- results
- caveats
- checks
- within-scope choices
- escalation-triggering issues
- roll-forward notes

**Tech notes are monthly-grouped.**

### Tech tracking logs

Location:

`2-processes/21-production-hub/tech-tracking/`

Use for continuous CSV logs:

- `tech_scope_choices.csv`
- `tech_escalations.csv`
- `tech_weekly_status.csv`

**Logs are continuous, not monthly.**

---

## 4. Required files after a substantive dev session

Update these when substantive technical work occurred:

- tech note `.md`
- tech note sidecar `.meta.yml`
- relevant `tech-tracking` CSVs
- `reports/ai_session_register.csv` if AI was used
- `reports/dev_time_tracker.csv` if dev time is being tracked

Link back to:

- related management note
- active scoping note
- commits
- outputs

---

## 5. AI session register

Location:

`2-processes/21-production-hub/reports/ai_session_register.csv`

Schema:

`seq,id,date,tool,short_summary,tags,transcript_path,transcript_exists,related_scope_id,related_tech_note`

Rules:

- no commas inside narrative fields
- use semicolons in `tags`
- booleans must be `TRUE` or `FALSE`
- use repo-relative transcript paths
- keep IDs unique

Transcript storage:

`4-memory/41-archive/chat-transcripts/`

---

## 6. Dev time tracker

Location:

`2-processes/21-production-hub/reports/dev_time_tracker.csv`

Schema:

`dev_time_id,date,person,activity,assisted_hours,manual_est_hours,efficiency_gain,related_scope_id,related_tech_note,notes,logged_mode`

Use this only for **actual dev work blocks**, not for setup-only planning sessions.

Efficiency formula:

`1 - assisted_hours / manual_est_hours`

Keep manual estimates conservative.

---

## 7. ID conventions

### Tech notes convention

`TN-YYYYMMDD-###`

### Tech tracking logs entry conventions

- `TC-YYYYMMDD-###` = within-scope technical choice
- `TE-YYYYMMDD-###` = escalation-triggering issue
- `TW-YYYYMMDD-###` = weekly status entry

### Dev time tracker

`DT-YYYYMMDD-###`

### AI session register

`{tool-prefix}-taps-dev-XXX`

Examples:

- `cgpt-taps-dev-127`
- `copt-taps-dev-128`

---

## 8. What counts as within scope

Log in `tech_scope_choices.csv` when the action stays technical and does not
change project meaning.

Examples:

- folder organization
- script refactoring
- staging format choices
- helper-function design
- bounded preprocessing
- figure layout choices

---

## 9. What triggers escalation

Log in `tech_escalations.csv` and reflect back to management when technical
work affects:

- source meaning
- schema assumptions
- linkage logic
- provenance clarity
- reproducibility
- cross-domain interpretation
- TWIG-facing framing
- whether a component must be deferred or reframed

**Rule:** do not solve management-significant issues silently in the dev repo.

---

## 10. Weekly status and rollover

Use `tech_weekly_status.csv` to track:

- what was planned
- what was completed
- what is partial
- what is blocked
- what rolls over

This is the main feeder for weekly management synthesis.

---

## 11. Sidecar rule

Tech notes must stay YAML-free.

Each tech note must have a paired sidecar file:

- `YYYY-MM-DD_topic.md`
- `YYYY-MM-DD_topic.meta.yml`

The sidecar is the authoritative structured metadata record.

---

## 12. Session-close minimum checklist

Before closing a substantive dev work block:

- [ ] tech note exists
- [ ] sidecar exists
- [ ] tracking logs updated if entries were generated
- [ ] AI session register updated if AI was used
- [ ] dev time tracker updated if time was tracked
- [ ] related management note referenced
- [ ] active scoping note referenced
- [ ] escalation items clearly marked

---

## 13. Practical rule

Use the minimum logging needed to preserve:

- reproducibility
- scope discipline
- escalation visibility
- weekly roll-up into management

Do not duplicate management governance records here.
Do not work without an active scope.
Do not confuse notes with logs.
