# AI Use in TAPs Development (Developer Guidance)

This is a practical crib sheet for analysts and developers.  
Follow these boundaries when using Generative AI (GenAI) tools in TAPs work.

## Allowed (Green List)

- Draft schema layouts and metadata **without real internal paths**.
- Use **Level 1-2 public snapshots only** (Surface Water, Groundwater, Water Rights).
- Generate code scaffolding, unit tests, and documentation with **synthetic data**.
- Draft caveats, chart captions, and plain-language summaries (always reviewed by staff).

## Not Allowed (Red List)

- No **Level 3+ or confidential data** in prompts (adjudication flags, internal QA, etc.).
- No **internal database connections**, service accounts, or file paths.
- No unreviewed AI text in final TAP outputs.
- No AI transcription/translation for public meetings (human interpreters required).

## Developer Practices

- Keep prompts clean: use synthetic rows or published examples only.
- Never paste real credentials, logs, or DB schema details.
- Commit `.env.example`, not real `.env` files.
- Add disclosure if GenAI assisted drafting (e.g., in PR template).

## Review

- All outputs must be **human-in-the-loop** reviewed before release.
- WG/Comms checkpoints remain the approval path for public-facing materials.

---
**Remember:** TAPs are non-regulatory, reproducible literacy tools.  
GenAI can assist, but analysts remain responsible for accuracy, clarity, and compliance.
