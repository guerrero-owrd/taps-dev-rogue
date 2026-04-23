# Provisional Inter-Repo Coordination Note

## Status

Provisional working guidance for the TWIG #2 pre-meeting development period.

This note exists to support immediate coordination between:

- `taps-proj-mgmt`
- `taps-dev-rogue`

It should be refined after TWIG #2 if the workflow proves useful.

---

## 1. Purpose

This note defines the minimum coordination rules needed to separate:

- project management and governance work
- technical development and implementation work

The goal is to reduce duplication, preserve traceability, and keep technical work moving without losing management control over scope, escalation, and weekly progress interpretation.

---

## 2. Core repo roles

### `taps-proj-mgmt`

Authoritative home for:

- management notes
- tech scoping notes
- formal decisions
- formal risks
- project-facing progress interpretation
- weekly management synthesis
- cross-session coordination

### `taps-dev-rogue`

Authoritative home for:

- tech notes
- tech tracking logs
- dev AI session register
- dev time tracker
- staged POC inputs
- scripts and build logic
- draft technical outputs

**Rule:** do not duplicate formal management logs in `taps-dev-rogue`.

---

## 3. Core coordination principle

Management and development are linked but not interchangeable.

- `taps-proj-mgmt` defines purpose, scope, escalation conditions, and project meaning.
- `taps-dev-rogue` records execution details, technical choices, outputs, and dev-side tracking.

The same full narrative should not be maintained in both repos.

---

## 4. Active scoping rule

Technical work should proceed under **one active scoping note** at a time for the relevant workstream.

### Scoping note rules

- scoping notes live only in `taps-proj-mgmt`
- the active scoping note is added as a source to the dev workspace
- the scoping note defines:
  - the current technical objective
  - what is authorized
  - what is out of scope
  - what assumptions apply
  - what triggers escalation

**Rule:** do not copy scoping notes into `taps-dev-rogue`.

---

## 5. Management note versus tech note

### Management note

Use the management note to record:

- why the work period exists
- project context
- weekly or phase objective
- technical scope and escalation boundary
- decisions and risks that matter project-wide
- weekly synthesis of technical progress
- cross-links to scoping notes, tech notes, commits, and outputs

### Tech note

Use the tech note to record:

- technical objective for a work block
- files, datasets, scripts, and outputs touched
- technical actions taken
- checks run
- assumptions and caveats
- within-scope technical choices
- escalation-triggering issues
- roll-forward notes

**Rule:** management note = project meaning; tech note = implementation detail.

---

## 6. Notes versus logs

### In `taps-proj-mgmt`

Use notes and formal logs for:

- management record
- formal decisions
- formal risks
- official progress interpretation

### In `taps-dev-rogue`

Use notes and logs for:

- tech execution notes
- continuous technical tracking
- dev AI session tracking
- dev efficiency tracking

### Dev-side tracking logs

Continuous CSV logs in `taps-dev-rogue`:

- `tech_scope_choices.csv`
- `tech_escalations.csv`
- `tech_weekly_status.csv`

These support management synthesis but do not replace formal governance logs.

---

## 7. Monthly versus continuous organization

### Monthly-grouped

Use monthly folders for:

- management notes
- tech notes
- tech scoping notes

### Continuous

Use continuous files for:

- formal management CSV logs
- dev-side tech-tracking CSV logs
- dev AI session register
- dev time tracker

**Rule:** notes are grouped; logs are continuous.

---

## 8. Weekly operating model for development-heavy periods

During development-heavy periods, the expected coordination pattern is:

1. create or update a management note in `taps-proj-mgmt`
2. create a weekly or phase-level tech scoping note in `taps-proj-mgmt`
3. add the active scoping note to the dev workspace sources
4. conduct technical work in `taps-dev-rogue`
5. record implementation details in tech notes and tech-tracking logs
6. generate weekly management synthesis from:
   - scoped objective
   - tech note outputs
   - dev-side tracking logs
   - escalation items
   - rollover items

This reduces management-note frequency during dev-heavy weeks without removing project control.

---

## 9. Escalation rule

Technical work must be reflected back into management tracking when it affects:

- source meaning
- schema assumptions
- linkage logic
- provenance clarity
- reproducibility
- cross-domain interpretation
- TWIG-facing framing
- whether a planned component must be deferred, replaced, or reframed

Use `tech_escalations.csv` and the escalation section of the tech note to surface such issues.

Do not resolve management-significant issues silently in the dev repo.

---

## 10. Cross-linking rule

### Management notes links

- related scoping note(s)
- related tech note(s)
- relevant dev commits
- relevant outputs
- promoted decisions or risks when applicable

### Tech notes links

- related management note
- active scoping note
- relevant tracking-log entries
- relevant outputs
- relevant commits

### Tracking logs should components

- related scope ID
- related tech note path
- related management session or note where applicable

---

## 11. AI session coordination

### Management-side AI sessions

Use the management-side session register in `taps-proj-mgmt`.

### Dev-side AI sessions

Use the dev-side session register in `taps-dev-rogue`.

Dev AI session IDs use:

- `cgpt-taps-dev-XXX`
- `copt-taps-dev-XXX`

The first dev AI session starts at:

- `cgpt-taps-dev-001`

**Rule:** management and dev AI session registers are separate.

---

## 12. Dev-side efficiency tracking

Development efficiency should be tracked separately from management-side staff time.

Use:

`2-processes/21-production-hub/reports/dev_time_tracker.csv`

This file records:

- assisted dev time
- conservative manual estimate
- efficiency gain
- related scope
- related tech note

Do not treat dev efficiency entries as formal staffing records.

---

## 13. Minimum closeout expectations

Before closing a substantive development period or weekly cycle, confirm:

- [ ] active scoping note exists in `taps-proj-mgmt`
- [ ] related management note exists or is updated
- [ ] tech note exists for substantive technical work
- [ ] dev tracking logs were updated if entries were generated
- [ ] dev AI session register was updated if AI was used
- [ ] dev time tracker was updated if time was tracked
- [ ] escalation items were surfaced back into management
- [ ] rollover items were identified for the next scoping period

---

## 14. Practical principle

This coordination model exists to preserve:

- traceability
- scope discipline
- escalation visibility
- efficient technical execution
- manageable weekly synthesis

It is intentionally provisional.

If it slows down real work more than it protects coherence, revise it after TWIG #2.
