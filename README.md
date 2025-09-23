# TAPs Development – Rogue Basin Pilot

This repository is the **development spine** for TAPs (Technical Assistance Packages).  
It contains reproducible code, schema mock-ups, and illustrative outputs for the Rogue pilot (and future basins once approved).  

TAPs are **screening-level, non-regulatory** literacy tools.  
Enforcement and permitting remain with Watermasters and WR staff; every figure carries a **“Not for enforcement”** banner.

---

## Purpose of this repo

- Stand up **R/Python/Quarto code** to generate reproducible TAPs.  
- Host **schema mock-ups, data dictionaries, and caveats** that define the reproducible pipeline.  
- Provide **templates, charts, and draft TAP outputs** for public review and QA.  
- Keep technical work clearly separated from sensitive management files (those live in `taps-proj-mgmt`, not here).

---

## Top-level folders (IPOM layout)

- **0-how-to**: cheatsheets for repo setup, GitHub, LFS, and workflow notes.  
- **1-inputs**: charter excerpts, rules insights, and analytical-engine code (schema mockups, scripts).  
- **2-processes**: production-hub scripts, technical notes, governance stubs, roadmap.  
- **3-outputs**: reproducible TAP deliverables, canonical templates, and user-facing graphics.  
- **4-memory**: archive of superseded builds and draft outputs.

---

## Repo hygiene

- **Code & schema**: live here, version-controlled.  
- **Staff time, decision logs, approvals**: live in the **mgmt** repo only.  
- **Quarterly**: run schema checks, refresh pipeline scripts, archive stale outputs.  
- **LFS**: large artifacts (PDFs, maps, images, binaries) are tracked with Git LFS.

---

## Notes

- Pilot basin: **Rogue River** (2025–26).  
- Snapshot cadence and staff time are approved in mgmt; this repo just executes.  
- Outputs are illustrative; final authority rests with OWRD systems and Watermasters.
