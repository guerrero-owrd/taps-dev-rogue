# 11 --- Knowledge Base

**Purpose**\
Canonical reference docs for TAPs: charters, rule insights, definitions,
and other background that informs Surface Water, Groundwater, and Water
Rights snapshots.

## What belongs here

- Project charter and appendices
- PBP rule summaries and definitions
- Method notes that inform snapshots (non-executable)
- Lightweight context notes explaining *why* a file matters

## Folder structure

    1-inputs/
      11-knowledge-base/
        excluded-docs/        # untracked by design (see policy below)
        README.md             # this file
        *.md                  # tracked source of truth

## Excluded-docs policy

- `excluded-docs/` is for drafts, vendor PDFs, or other
non-reproducible materials we do **not** commit.
- A `.gitkeep` file preserves the folder; contents stay untracked via
    `.gitignore`.
- A pre-commit hook logs any untracked files placed here to
    `2-processes/24-risk-register/excluded-docs-log.txt`.

## Conventions

- **Format:** prefer `.md` over `.docx/.pdf` for tracked docs.
- **Names:** `YYYY-MM-DD_topic.md` when date-relevant; otherwise
    short, specific names.
- **Context line:** first 1--2 lines should state why the file exists
    and how it's used in TAPs.

## Add a new reference

1. Create a Markdown file with a one-line purpose statement at the top.
2. If you must stash a binary (draft/report), drop it in
    `excluded-docs/` instead.
3. Commit Markdown; the hook will warn if binaries show up where they
    shouldn't.

## Change log

- 2025-10-21: Added `excluded-docs/` policy and pre-commit logging note.
