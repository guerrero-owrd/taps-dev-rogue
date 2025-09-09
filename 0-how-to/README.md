# 0-how-to

This folder is the **quick-start library** for TAPs Project Management (TAPs-PM).  
It holds short guides, cheat-sheets, and reproducible methods that define *how* work sessions are run and logged.

---

## Purpose
- Provide **operational workflow guidance** for day-to-day project management.
- Keep muscle-memory routines accessible (`cheatsheets/`).
- Complement program-level documentation in the TAPs Charter (`Core Framework`, `Roadmap`, `Governance`, `Decision Requests`, `Risks`, `Proposal & Appendices`).

---

## Session Workflow
All work sessions follow the cycle:

**Note → Do → Crystallize → Log → Prep**

1. **Note**: start with an agenda in `2-processes/21-production-hub/notes/`.  
2. **Do**: work on one agenda item at a time.  
3. **Crystallize**: when a decision/action emerges, jot it immediately in the note.  
4. **Log**: at session end, update canonical files:
   - `decisions.csv` (23-decision-log)  
   - `risk_log.csv` (24-risk-register)  
   - `schedule.csv` (12-analytical-engine)  
   - `staff_time.csv` (12-analytical-engine)  
5. **Prep**: copy today’s note forward with a draft agenda for the next session.

---

## Staff-Time Logging
- Schema:  
  ```
  date,person,activity,hours,mode,notes
  ```
- **mode** = `assisted` or `manual_est` (manual non-AI baseline).  
- Each activity × mode gets its own row (long format).  
- This structure enables later pivoting (e.g., efficiency % and cost savings by staff role).

---

## Repo Boundaries
- **TAPs-PM**: project management only — governance, decisions, risks, reproducibility standards, meeting notes.  
- **TAPs-dev** (future): TAPs product development — snapshot ETL, code, data-driven outputs, technical cheat-sheets.  
  *Both repos use the IPOM skeleton and `0-how-to/cheatsheets/` to stay reproducible.*

---

## Current contents
- **cheatsheets/**  
  - `powershell.md` — create/verify file structure.  
  - `filesystem.md` — navigate the repo and log activities.  
  - `session-workflow.md` — integrated doing + logging routine.  
  - (future) `meetings.md`, `coding.md`, `quarterly.md`.
  
---
## Conventions
- Filenames are short and topical (powershell.md, ilesystem.md).  
- Each file begins with a clear H1 heading (e.g., # How to Use PowerShell...).  
- Keep examples reproducible: scripts should be copy-paste ready.  
- Update guides when practices evolve; archive old ones in 4-memory/41-archive.

---

**Principle:** If it’s *how we work*, it belongs here.  
If it’s *what TAPs are*, see the Charter.
