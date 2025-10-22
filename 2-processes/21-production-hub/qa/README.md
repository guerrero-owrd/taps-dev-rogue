# QA Utilities — TAPs-PM

This folder contains lightweight, **Quality Assurance (QA) and verification scripts**
used during TAPs-PM daily sessions.  
Scripts here are designed to **support reproducibility and hygiene checks** —  
not to produce analytical outputs.

---

## Purpose

- Verify expected files and directories exist.  
- Capture modification timestamps for canonical artifacts (`schedule.csv`, `decisions.csv`, etc.).  
- Support session logging by writing dated CSV reports that can be linked from daily notes.  
- Detect drift between planned structure and actual repository state.

---

## Key Script

### `filecheck.R`

- Confirms presence of required TAPs-PM folders and logs their last modified times.  
- Produces a CSV in `/2-processes/21-production-hub/notes/` named  
  `YYYY-MM-DD_filecheck.csv`.  
- Uses only base R for maximum portability.  
- Invoked directly or via `make qa-filecheck`.

#### Example

```bash
make qa-filecheck
# or, from R console
source("2-processes/21-production-hub/qa/filecheck.R")
```

---

## Storage Policy

- Scripts in this folder are **transient helpers** that may evolve but are still version-controlled.  
- When a script becomes standardized across TAPs modules, move a copy to  
  `/3-outputs/33-templates/qa-tools/` (if created) for reference.

---

## Logging

Every QA run should be mentioned in the daily session note (`/notes/YYYY-MM-DD_session.md`)
with a link to the generated CSV.

Example:

```r
**QA Check**
- Ran `filecheck.R`; output: [2025-10-21_filecheck.csv](2025-10-21_filecheck.csv)
- Missing: none.
```

---

**Reminder:** This folder supports *Illustrative — not for enforcement* TAPs reproducibility hygiene.
Do not store analytical code or dataset copies here.
