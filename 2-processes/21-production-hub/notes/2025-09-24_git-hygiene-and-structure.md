# 2025-09-24 — Git Hygiene and Repo Structure Fixes

## Context

Session focused on cleaning up version control behavior between **taps-dev-rogue** (public, reproducible) and **taps-proj-mgmt** (local, sensitive).

Both repos had drifting file visibility and maintenance friction.  
Main goals: confirm LFS setup, repair `.gitignore` logic, and align documentation.

---

## Key Actions

### 1. Updated `.gitattributes`

- Expanded Git LFS tracking for PDFs, DOCX, PPTX, XLSX, images, geospatial binaries, and R/Python data formats.  
- Verified pointer behavior and clone workflow (i.e., how to connect instructions across taps-dev-rogue (remote) and taps-proj-mgmt(local))  
- Added cheatsheet `0-how-to/cheatsheets/git-lfs-cheatsheet.md`.

### 2. `.gitignore` Repair (taps-dev-rogue)

- **Problem:** `1-inputs/**` pattern prevented knowledge-base and analytical-engine folders from appearing on GitHub.  
- **Fix:** un-ignored the parent and its two subtrees:

  ```gitignore
  1-inputs/**
  !1-inputs/
  !1-inputs/11-knowledge-base/
  !1-inputs/11-knowledge-base/**
  !1-inputs/12-analytical-engine/
  !1-inputs/12-analytical-engine/**
  ```

- Cleared ignore cache and re-added the inputs folders.  
- Commit: `fix(gitignore): unignore parent and include inputs subtrees`.

### 3. Documentation Refresh

- Replaced `README.md` with **development-focused** version (clarified dev vs mgmt scope).  
- Added `CONTRIBUTING.md` at repo root (branching, commit prefixes, LFS rules, hygiene).  
- Confirmed `.gitignore` and `.gitattributes` both reside at root and visible with `fs::dir_tree(all = TRUE)`.

### 4. Structural Notes

- Confirmed need for `README.md` placeholders in empty folders (GitHub visibility).  
- Discussed commit prefix conventions:
  - `feat:` new functionality
  - `fix:` correction of misconfiguration
  - `docs:` documentation only
  - `chore:` maintenance/config work

---

## Outcomes

- Reproducibility and visibility aligned: `1-inputs` now visible online with key docs.  
- Clear separation reaffirmed:  
  - **mgmt repo** → governance, approvals, risk/decision logs.  
  - **dev repo** → code, schemas, reproducible outputs.  
- Git hygiene standardized; LFS and ignore rules tested successfully.  
- Ready for quarterly hygiene update cycle.

---

## Next Hygiene Task (Oct 2025)

- Verify LFS storage quotas and bandwidth in GitHub settings.  
- Ensure schema mockups in `1-inputs/12-analytical-engine/` remain synced with production workflow.  
- Add cross-reference link in mgmt `2-processes/21-production-hub/notes`.
