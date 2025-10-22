# How to Navigate and Log Activities in TAPs-Dev

This cheat-sheet explains what each folder is for and how to record activities consistently.

---

## 0-how-to

-**cheatsheets**
Stores core instructions about "how-to" create repo settings in a reproducible way, like `filesystem.md`, `github-repo-setup.md`, among others.

## 1-inputs

- **11-knowledge-base**  
  Store reference docs: project charter, appendices, PBP rule insights.
  `excluded-docs/`folder: holds untracked reference materials (logged
  via .git/hooks; not committed)
  *Tip:* add a one-line context note when adding a file (why it matters).
- **12-analytical-engine**  
  Simple tables for tracking: schedule, RACI, staff-time.  
  *Tip:* CSV only; no fancy analytics here.

---

## 2-processes

- **21-production-hub**  
  Drafts, meeting notes, in-progress reports.  
  *Log here:* daily work products. Move finals to outputs.
- **22-governance**  
  RACI matrices, rosters, oversight notes.  
  *Log here:* updates to roles or protocols.
- **23-decision-log**  
  Use a table (`decisions.csv`) to log approvals, scope changes, leadership calls.  
  *Always log here, not just in meeting notes.*
- **24-risk-register**  
  Use `risk_log.csv` to track risks. Review quarterly.  
  *Include probability (1–5), impact (1–5), mitigation, owner.*
- **25-roadmap**  
  Milestones and burndowns.  
  *Log here:* updated timelines, progress vs. plan.

---

## 3-outputs

- **31-product-store**  
  Final, approved artifacts. PDFs/HTML only.  
  *Log here:* version, date, and changelog.
- **32-user-engagement**  
  Copies with comments, external reviews.  
  *Log here:* who reviewed, date, summary of feedback.
- **33-templates**  
  Canonical templates (meeting notes, quarterly reports).  
  *Do not edit directly; copy into production-hub.*

---

## 4-memory

- **41-archive**  
  Superseded material.  
  *When archiving:* add a note explaining what superseded the file.

---

## Logging Conventions

- **Date format:** YYYY-MM-DD (e.g., 2025-08-26)  
- **Meeting notes filename:** `YYYY-MM-DD_topic.md`  
- **Decision status:** proposed | approved | declined | superseded | closed  
- **Risk status:** open | monitoring | mitigated | closed  
- **Quarterly hygiene:**  
  1. Move finals to outputs.  
  2. Archive stale drafts.  
  3. Refresh decision/risk logs.  
  4. Sync roadmap to actuals.
