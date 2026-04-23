<!--
template_name: tech_note_template
template_version: 0.1
updated: 2026-04-22
status: draft
-->

# Tech Note - [Short Technical Topic]

## Note header

- **date:** YYYY-MM-DD
- **tech_note_id:** `TN-YYYYMMDD-###`
- **related_mgmt_session_id:** `cgpt-taps-XXX`
- **related_scope_id:** `TS-YYYYMMDD-###`
- **session_mode:** solo | coordination | review
- **status:** draft | in_review | stable | deprecated
- **retention:** working | permanent | archival
- **topic_tags:** poc; tech_note; geospatial; time_series; staging
- **ai_touchpoints:** drafting; retrieval; code_review; refactor; summarization; none

## Required sidecar metadata

Create a matching sidecar metadata file for this note:

- **Note:** `YYYY-MM-DD_topic.md`
- **Metadata:** `YYYY-MM-DD_topic.meta.yml`

Keep this `.md` note YAML-free.  
The `.meta.yml` is the authoritative structured metadata record.

Suggested minimum fields in `*.meta.yml`:

- `tech_note_id`, `date`, `session_mode`, `status`, `retention`
- `topic_tags`, `ai_touchpoints`
- `related_mgmt_session_id`, `related_scope_id`
- `related_decisions`, `related_risks`, `related_staff_time`
- `linked_commits`, `linked_mgmt_notes`, `linked_outputs`
- `logged_mode: on-time|retrospective`
- `extraction_confidence: low|med|high`

## Usage

- This template is for technical work notes stored in `taps-dev-rogue`.
- Use it to record implementation work such as dataset staging, code changes, validation checks, technical assumptions, blockers, and output generation.
- Do not duplicate the full management narrative here.
- Use the paired management note in `taps-proj-mgmt` for project-facing purpose, decisions, risks, and governance interpretation.
- Use the active tech scoping note from `taps-proj-mgmt` to define the technical boundary for this note.

## 1. Technical objective

State the concrete technical objective for this work block.

Examples:

- stage minimum viable POC datasets
- test gage linkage workflow
- generate first draft POC figure
- review WR source structures for bounded extension

## 2. Active scope reference

- **Active tech scoping note:** [path or filename]
- **Authoritative management note:** [path or filename]

### Scope reminder

Briefly restate the part of the active scope that matters for this technical work block.

## 3. Inputs touched

List the datasets, folders, source files, scripts, or manifests touched in this work block.

### Datasets / source materials

- [ ] path or source
- [ ] path or source

### Scripts

- [ ] path
- [ ] path

### Outputs

- [ ] path
- [ ] path

## 4. Technical actions taken

Describe the technical work actually performed.

Examples:

- created folder structure for POC staging
- downloaded and staged HUC-10 boundary layer
- tested stream gage linkage
- drafted `twig2_poc_build.R`
- reviewed WR source metadata and geometry structure

## 5. Results

Summarize what was achieved technically.

### Completed

- [ ] item
- [ ] item

### Partial

- [ ] item
- [ ] item

### Failed or blocked

- [ ] item
- [ ] item

## 6. Assumptions and caveats

Document the assumptions, limitations, and provisional elements that affected this work.

Examples:

- climate representation remains derived and provisional
- WR review is exploratory and non-blocking for first POC build
- current output is discussion support only
- source provenance remains incomplete pending validation

## 7. Validation and checks

Record any checks run during the work block.

| Check | Result | Notes |
| :-- | :-- | :-- |
| CRS consistency | pass / fail / partial | |
| HUC-10 alignment | pass / fail / partial | |
| Domain ID preservation | pass / fail / partial | |
| Reproducibility of step | pass / fail / partial | |
| Output generated | pass / fail / partial | |

## 8. Within-scope technical choices

Record technical choices that remained within the active scope.

| Entry ID | Topic | Choice / action | Rationale | Affected files / outputs | Why within scope |
| :-- | :-- | :-- | :-- | :-- | :-- |
| TC-YYYYMMDD-### | | | | | |

## 9. Escalation-triggering issues

Record issues or discoveries that crossed the escalation boundary and should be reflected back into management tracking.

| Entry ID | Topic | Issue / action | Trigger type | Why escalated | Recommended follow-up |
| :-- | :-- | :-- | :-- | :-- | :-- |
| TE-YYYYMMDD-### | | | source_substitution / schema_change / linkage_change / reproducibility / provenance / interpretation / publication_path | | |

## 10. Weekly synthesis hooks

Use this section to make later management synthesis cheaper.

### Progress against scoped objective

- [ ] materially advanced
- [ ] partially advanced
- [ ] blocked

### Key outputs produced

- [ ] output
- [ ] output

### Key blockers

- [ ] blocker
- [ ] blocker

### Items likely to roll over

- [ ] item
- [ ] item

## 11. File and commit logging

- **Linked management note:** [path]
- **Linked scoping note:** [path]
- **Linked commits:**
  - taps-dev-rogue@`<short-hash>` — `<summary>`
- **Tracking logs updated:**
  - `tech_scope_choices.csv`
  - `tech_escalations.csv`
  - `tech_weekly_status.csv`

## 12. Cross-references

- Related mgmt note(s): [paths]
- Related scoping note(s): [paths]
- Related output(s): [paths]
- Related commit(s):
  - taps-dev-rogue@`<hash>` — `<summary>`

## 13. Roll-forward note

State what should happen next if this work block is incomplete.

| Pending task | Reason still open | Next action | Priority |
| :-- | :-- | :-- | :-- |
| | | | low/med/high |

## 14. Design pivots and dead ends (optional)

Record discarded approaches, failed attempts, or technical dead ends that may matter later.

## End of tech note
