# Meeting Notes — TAPs-Dev Kickoff Prep
**Date:** 2025-08-27  
**Attendees:** FJG (+ AI assistant)  
**Session length:** 2.5 hours

## Critical Update (logged 2025-08-27)

**IT TAPs-wide support reduced until Q1-2026.**

### Immediate Implications
- **Partial IT support via tickets:**  
  - Repo permissions, GitHub setup, and other low-touch items remain possible.  
  - DBA/DevOps-heavy work (snapshot builds, schema-level queries, containerization) deferred until 2026.

- **Mock-up Rogue Pilot (manual path):**  
  - Data can be manually pulled from OWRD public databases (WRIS, SWARS, GWIS) to assemble an *illustrative-only* pilot.  
  - This fulfills IT’s request for a demo artifact and provides a practical test of whether statewide snapshots are essential.  
  - Must be clearly bannered: **“Illustrative, not reproducible — not for enforcement.”**

- **Reframed risk:**  
  - Risk is *limited bandwidth* rather than *total IT blackout*.  
  - Main consequence is delay to automation and statewide datasets, not to PCI-led development (repo scaffolding, PA-Slicer, caveats, manual pilot).

### Action Flags
- Adjust plans for the immediately following meetings for TAPs development, including today's meeting.
- Continue with repo scaffolding, PA-Slicer, and caveat cheat-sheet as planned.  
- Scope and label the manual Rogue Pilot deliverable to manage expectations.  
- Update roadmap milestones to reflect delayed automation, but keep interim PCI-only outputs active.  
- Prepare leadership decision request: endorse adjusted timeline and authorize illustrative pilot work.


## Objectives
- Make a **quick assessment** on the immediate implications of the IT update on work in the following days. 
- Initialize a separate **TAPs development repo** (working name: `taps-dev` or `taps-pilot`) with an IPOM skeleton plus `0-how-to/cheatsheets/`.  
  *[Still valid. No change]*  
- Draft **snapshot caveat cheat-sheet v0.1** (overdue) and a matching template for future runs.  
  *[Still valid. Now considered part of interim PCI-only deliverables]*  
- Keep management hygiene: decisions/risks/schedule/time updated in TAPs-PM.  
  *[Still valid. No change]*  
- **NEW:** Scope and define *illustrative Rogue Pilot (manual pull)* to satisfy IT’s mock-up request.  
  *[Added in response to IT update]*  

## Agenda (timeboxed total = 180 min)
1. **Open & review yesterday (10 min)**  
   - Skim 2025-08-26 note, confirm carry-overs.
2. **Quick assessment of activities after IT update (30 min)**
   - Include a critical update addendum to today's note re: changes in IT support.
   - Adjust objectives, agenda items, and other downstream component.
2. **Scaffold TAPs-dev repo (50 min)**  
   - Create IPOM folders; add README stubs.  
   - Add `0-how-to/cheatsheets/` with a placeholder index.  
   - Decide on minimal tech spine (none vs renv+Quarto now).
3. **Draft snapshot caveat cheat-sheet v0.1 (60 min)**  
   - Outline scope: metadata, assumptions, gaps, intended use, banner.  
   - Save as `snapshot-caveat.md` plus a `.qmd` or `.md` template under templates.  
   - Note any blockers (data access, wording).
4. **Governance hygiene (15 min)**  
   - Log decisions to `decisions.csv`.  
   - Update `risk_log.csv` if scope/timeline changes.  
   - Add milestone(s) to `schedule.csv`.  
5. **Prep next session (15 min)**  
   - Create 2025-08-28 note with draft agenda.  
   - Record staff time for today.

## Decisions to make today (record in 23-decision-log)
- **Repo name:** `taps-dev` vs `taps-pilot` (Rogue Basin first).  
- **Tech spine:** start minimal vs enable `renv` + Quarto now.  
- **Cheat-sheet scope:** snapshot caveat content and template format.  
- **Data boundary language:** reaffirm "screening-level, non-regulatory" banner.

## Actions (assign owners and due dates)
- [ ] Create TAPs-dev skeleton (Inputs/Processes/Outputs/Memory + 0-how-to).  
- [ ] Draft `0-how-to/cheatsheets/snapshot-caveat.md`.  
- [ ] Add `3-outputs/33-templates/snapshot-caveat.md` (template file).  
- [ ] Log decisions/risks/schedule; enter staff time.  
- [ ] Create 2025-08-28 note with agenda.

## Notes / Constraints
- Keep names short/ASCII to avoid sync drama.  
- Finals live in TAPs-dev `3-outputs`; TAPs-PM remains management-only.  
- Charter guardrails: screening-level, reproducible, not for enforcement.

## End-of-session outputs (definition of done)
- TAPs-dev folder skeleton exists with basic READMEs.  
- Snapshot caveat cheat-sheet v0.1 saved and template added.  
- Decisions, risks, schedule updated in TAPs-PM.  
- Staff time recorded; next note created.
