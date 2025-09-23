# Meeting Notes-TAPs-Dev Kickoff Prep

**Date:** 2025-09-16  
**Attendees:** FJG (+ AI assistant)  
**Session length:** 2.5 hours

## Context refresher

- Last week TAPs was deprioritized due to higher-urgency work; carry-overs remain open.
- IT TAPs-wide support remains reduced until **Q1-2026**; low-touch ticketed items only.

## Critical Update (standing, from 2025-08-27)

- Partial IT via tickets is possible (repo permissions, GH setup).  
- DBA/DevOps-heavy work (snapshots, schema queries, containerization) is deferred to 2026.
- Manual Rogue Pilot remains illustrative-only; clearly bannered and with non-reproducibility note about data sources.

## Additional Update (from 2025-09-16)

- Assessing the possibility of generating snapshots and store outputs in Zenodo or other open-data archives for URL access.
- Decision on basin for code development and deployment pending until **Sept. 30th, 2025**

### Immediate Implications

- **Partial IT support via tickets:**
  - Zenodo or other open data storage alternatives need to be identified.
  - Requires authorization by IT and other involved.
  - Repo permissions, GitHub setup, and other low-touch items remain possible.  
  - DBA/DevOps-heavy work (snapshot builds, schema-level queries, containerization) deferred until 2026.

- **Mock-up Rogue Pilot (manual path):**  
  - Data can be manually pulled from OWRD public databases (WRIS, SWARS, GWIS) to assemble an *illustrative-only* pilot.  
  - This fulfills IT's request for a demo artifact and provides a practical test of whether statewide snapshots are essential.
  - Visual resolution for results display would be HUC-10  
  - Must be clearly bannered: **“Illustrative, not reproducible — not for enforcement.”**

- **Reframed risk:**  
  - Risk is *limited bandwidth* rather than *total IT blackout*.  
  - Main consequence is delay to automation and statewide datasets, not to PCI-led development (repo scaffolding, PA-Slicer, caveats, manual pilot).
  - **Pivot**: Wihtout IT-TSD snapshots, we shift from pre-launch protocol to single-basin **Rogue pilot** at HUC-10.
  - **Consequences**: Time/capacity estimates for statewide snapshot production will be speculative if inferred from this manual pilot. 
  - **Mitigation**: Treat Rogue as a **surrogate**, exercise SW/GW/WR modules with schema mock-ups, and archive frozen
  inputs externally (e.g., Zenodo/OSF) with non-regulatory banners and a **source non-reproducibility** note. 

### Action Flags
- Continue with repo scaffolding, PA-Slicer, and caveat cheat-sheet as planned.
- Scope and label the manual Rogue Pilot deliverable to manage expectations.
- Update roadmap milestones to reflect delayed automation, but keep interim PCI-only outputs active.
- Prepare leadership decision request: endorse adjusted timeline and authorize illustrative pilot work.
- Treat **Rogue @ HUC-10** as the surrogate path; add coverage/representativeness mapping and ENSO linkage stub to scope.
- Draft **schema mock-ups v0.1** (SW/GW/WR) and a minimal data dictionary to emulate future snapshots.
- Select a **public archive** (e.g., Zenodo/OSF) for frozen inputs and code; include banner + **non-reproducibility note** about data sources.


## Objectives
- Initialize a separate **TAPs development repo** (working name: `taps-dev` or `taps-pilot`) with an IPOM skeleton plus `0-how-to/cheatsheets/`.  
  *[Still valid. No change]*
- Draft **snapshot caveat cheat-sheet v0.1** (overdue) and a matching template for future runs.  
  *[Still valid. Now considered part of interim PCI-only deliverables]*
- Keep management hygiene: decisions/risks/schedule/time updated in TAPs-PM.  
  *[Still valid. No change]*
- **Scope and define the *illustrative Rogue Pilot (manual pull)* at HUC-10**, including coverage/representativeness and ENSO-linkage stubs.  
  *[Added in response to IT update]*
- **Draft schema mock-ups v0.1 + data dictionary** for SW/GW/WR to mirror future snapshot structures.  
  *[New to support the surrogate approach]*
- **Choose external archive + apply banner/non-reproducibility language** for pilot artifacts.  
  *[New to ensure provenance and clarity]*

## Agenda (timeboxed total = 180 min)
1. **Open & review carry-overs (40 min)**  
   - Confirm open items and today’s targets.

2. **Quick assessment after IT update + Rogue HUC-10 scope (40 min)**  
   - Insert addendum on IT status; reaffirm surrogate approach.  
   - Define pilot scope: map stack (hydrologic regimes, WR totals/dominant use/entropy, seniority percentiles, GW coverage/gaps), coverage/representativeness view, ENSO linkage stub.  
   - Confirm banner + **non-reproducibility note** about data sources.

3. **Scaffold TAPs-dev repo (50 min)**  
   - Create IPOM folders; add README stubs.  
   - Add `0-how-to/cheatsheets/` with a placeholder index.  
   - Decide on minimal tech spine (none vs renv+Quarto now).

4. **Draft snapshot caveat cheat-sheet v0.1 (60 min)**  
   - Outline scope: metadata, assumptions, gaps, intended use, banner.  
   - Save as `snapshot-caveat.md` plus a `.qmd` or `.md` template under templates.  
   - Note blockers (data access, wording).

5. **Governance hygiene (15 min)**  
   - Log decisions to `decisions.csv`.  
   - Update `risk_log.csv` if scope/timeline changes.  
   - Add milestone(s) to `schedule.csv`.

6. **Prep next session (15 min)**  
   - Create **2025-09-09** note with draft agenda.  
   - Record staff time for today.

## Decisions to make today (record in 23-decision-log)
- **Repo name:** `taps-dev` vs `taps-pilot` (Rogue Basin first).
- **Tech spine:** start minimal vs enable `renv` + Quarto now.
- **Cheat-sheet scope:** snapshot caveat content and template format.
- **Data boundary language:** reaffirm "screening-level, non-regulatory" banner.

- **Surrogate approach:** confirm **Rogue @ HUC-10** as the pilot stand-in for statewide.
- **Pilot map stack:** approve scope:
  - SW: regime clusters + trend sign/magnitude; coverage/representativeness view; ENSO linkage stub.
  - WR: total allocation, dominant use, use heterogeneity \(H^*\), seniority percentiles.
  - GW: monitoring coverage & gaps (no trend claims).
- **Schema mock-ups v0.1:** approve minimal field lists and join keys for SW/GW/WR to emulate future snapshots.
- **Archive platform:** select **Zenodo/OSF/Figshare** for frozen inputs + code; decide DOI now vs later; confirm license.
- **Banner & provenance text:** approve “Illustrative Pilot — Not Production Data” + **non-reproducibility note about data sources**.
- **Low-touch IT tickets:** authorize opening tickets for repo permissions and GH setup only.


## Actions (assign owners and due dates)
- [ ] Create TAPs-dev skeleton (Inputs/Processes/Outputs/Memory + 0-how-to).  
  *Owner: FJG | Due: 2025-09-08*
- [ ] Draft `0-how-to/cheatsheets/snapshot-caveat.md`.  
  *Owner: FJG | Due: 2025-09-08*
- [ ] Add `3-outputs/33-templates/snapshot-caveat.md` (template file).  
  *Owner: FJG | Due: 2025-09-08*
- [ ] Log decisions/risks/schedule; enter staff time.  
  *Owner: FJG | Due: 2025-09-08*
- [ ] Create **2025-09-09** note with agenda.  
  *Owner: FJG | Due: 2025-09-08*

### New actions for the surrogate pilot & provenance
- [ ] **Draft schema mock-ups v0.1** (SW/GW/WR) + minimal data dictionary.  
  *Owner: FJG | Due: 2025-09-08*
- [ ] **Freeze first Rogue public exports** under `1-inputs/raw/YYYY-MM-DD/` and write `.sha256` checksums.  
  *Owner: FJG | Due: 2025-09-08*
- [ ] **Select public archive** (Zenodo/OSF/Figshare), create sandbox record, capture draft citation.  
  *Owner: FJG | Due: 2025-09-08*
- [ ] Add **banner + non-reproducibility note** to report template and figure caption suffix.  
  *Owner: FJG | Due: 2025-09-08*
- [ ] Add **coverage & representativeness** map spec and **ENSO linkage** stub to pilot scope doc.  
  *Owner: FJG | Due: 2025-09-08*
- [ ] **Open low-touch IT tickets** (repo permissions, GH setup).  
  *Owner: FJG | Due: 2025-09-08*
- [ ] **Log 30 min visual scoping** of Rogue HUC-8/10 and gage layout in Staff Time (assisted).  
  *Owner: FJG | Due: 2025-09-08*


## Notes / Constraints
- Keep names short/ASCII to avoid sync drama.
- Finals live in TAPs-dev `3-outputs`; TAPs-PM remains management-only.
- Charter guardrails: screening-level, reproducible methods, **not for enforcement**.
- **Manual Rogue Pilot is illustrative only; clearly bannered and with a non-reproducibility note about data sources.**
- **Public-only data** in external archives; no sensitive/restricted content. Upstream regeneration from source systems is **not guaranteed equivalent** until IT snapshots exist.
- **Gage coverage skew** toward upper basin; downstream polygons rely more on NWM. Coverage/representativeness map required.
- Containerization optional for now; record package versions and environment info in outputs.


## End-of-session outputs (definition of done)
- TAPs-dev folder skeleton exists with basic READMEs.
- Snapshot caveat cheat-sheet v0.1 saved and template added.
- **Pilot scope approved** (map stack, coverage/representativeness, ENSO stub).
- **Schema mock-ups v0.1 + data dictionary drafted** (SW/GW/WR).
- **Public archive** selected and sandbox record created (or documented decision to defer DOI).
- Banner and **source non-reproducibility** language inserted into templates.
- Decisions, risks, schedule updated in TAPs-PM.
- Staff time recorded; next note (**2025-09-09**) created.
