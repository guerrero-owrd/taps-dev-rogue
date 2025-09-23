# Contributing to TAPs Development (Rogue Pilot)

Thanks for contributing! This repository is for **technical development** of TAPs  
(Technical Assistance Packages) — code, schema mock-ups, templates, and reproducible outputs.

⚠️ **Reminder:** Management files (staff time, approvals, decision logs, risk registers)  
belong in the **taps-proj-mgmt** repo. Keep this repo focused on reproducibility.

---

## Ground Rules

- **Screening-level only**: TAPs are literacy tools, not regulatory products.  
  Every chart/figure must include the “Not for enforcement” banner.  
- **Reproducibility first**: all analysis must be scripted (R/Python/Quarto).  
  No manual edits to final outputs.  
- **Version control**: commit code and light-weight docs. Track heavy binaries with Git LFS.  
- **Data firewall**: only public-safe datasets and approved snapshots belong here.  
  Internal OWRD databases stay behind the firewall.

---

## Workflow

1. **Branching**
   - `main` = stable, public-safe code and templates.  
   - `dev/*` = feature branches for active work (e.g., `dev/schema-update`, `dev/flow-slicer`).

2. **Commits**
   - Use clear prefixes:  
     - `feat:` new code or schema  
     - `fix:` bug or correction  
     - `docs:` documentation changes  
     - `chore:` cleanup, non-functional changes  
   - Keep messages concise but descriptive.

3. **Pull Requests**
   - Required for merging to `main`.  
   - Include: purpose of change, test evidence (script runs, output checks), and updated docs if needed.

4. **Reviews**
   - PCI Sr. Analyst reviews code logic and reproducibility.  
   - TAPs Working Group may review outputs, not raw code.

---

## Large Files

- PDFs, DOCX, images, Parquet, GeoPackages = tracked with **Git LFS**.  
- CSV/TSV/JSON/MD/R/QMD files = normal Git (keep diffable).

Check tracked files with:

```bash
git lfs ls-files
```

---

## Hygiene & Maintenance

- Run schema check before major merges.  
- Archive superseded outputs in `4-memory/`.  
- Document caveats in `0-how-to/cheatsheets/` or inline in code.  
- Sync README + manifest quarterly.

---

## Code of Conduct

Be constructive, document your changes, and respect the separation between  
**technical reproducibility** (here) and **program governance** (mgmt repo).
