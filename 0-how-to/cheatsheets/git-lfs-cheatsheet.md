# Git LFS Cheatsheet (TAPs Dev)

This cheatsheet documents how this repository uses **Git Large File Storage (LFS)** for TAPs-related artifacts (reports, figures, binary data). It covers setup, daily use, migration, verification, and troubleshooting.

---

## 0) How Git-LFS works

- Pointer files: In Git history, large files (PDFs, images, binaries) are replaced with tiny pointer text files (approx.100 bytes) containing metadata (SHA-256 hash, size, LFS version).

- Real binaries: The actual heavy files are stored separately in Git LFS storage.

- Clone/checkout: If Git LFS is installed, these pointer files are automatically swapped for the real binaries on disk. Without LFS installed, you will only see the pointer.

- Push/pull: Commits still behave normally (git add/commit/push), but the bulk content goes through LFS servers instead of normal Git object storage.

This keeps your repo lean, prevents Git history bloat, and avoids broken diffs/merges for binary files.

### .gitattributes Syntax Basics

Each line has the form:

pattern attribute1 attribute2 ...

pattern: File glob (e.g., *.pdf, data/**).

filter=lfs: Store matching files in LFS, not main Git history.

diff=lfs / merge=lfs: Disable normal text diff/merge, use LFS handling.

-text: Mark files as binary; prevents newline normalization.

text eol=lf (optional): For code/text files, normalize line endings.

Example:

*.pdf  filter=lfs diff=lfs merge=lfs -text
*.R    text eol=lf
*.qmd  text eol=lf

First line: all PDFs go to LFS, no text diffs, no newline meddling.

Second/third lines: R and Quarto code stay as plain text, normalized to LF line endings.

---

## 1) One-time setup (per machine)

```bash
# Install Git LFS (package manager or installer)
# macOS:  brew install git-lfs
# Ubuntu: sudo apt-get install git-lfs
# Windows: use the official installer

# Enable LFS in your global git config
git lfs install
```

> Verify: `git lfs version` should return a version string.

---

## 2) Patterns tracked in this repo

We track binary-ish outputs via LFS; code and plain-text stay as normal Git.

Add these lines in **.gitattributes** (already in this repo):

```gitattributes
# Documents
*.pdf  filter=lfs diff=lfs merge=lfs -text
*.docx filter=lfs diff=lfs merge=lfs -text
*.pptx filter=lfs diff=lfs merge=lfs -text
*.xlsx filter=lfs diff=lfs merge=lfs -text

# Graphics & renders
*.png  filter=lfs diff=lfs merge=lfs -text
*.jpg  filter=lfs diff=lfs merge=lfs -text
*.jpeg filter=lfs diff=lfs merge=lfs -text
*.tif  filter=lfs diff=lfs merge=lfs -text
*.tiff filter=lfs diff=lfs merge=lfs -text
*.svg  filter=lfs diff=lfs merge=lfs -text

# Data binaries
*.parquet filter=lfs diff=lfs merge=lfs -text
*.feather filter=lfs diff=lfs merge=lfs -text
*.rds     filter=lfs diff=lfs merge=lfs -text
*.RData   filter=lfs diff=lfs merge=lfs -text

# Geospatial
*.gpkg filter=lfs diff=lfs merge=lfs -text
*.zip  filter=lfs diff=lfs merge=lfs -text

# Notebooks & archives
*.ipynb  filter=lfs diff=lfs merge=lfs -text
*.tar    filter=lfs diff=lfs merge=lfs -text
*.tar.gz filter=lfs diff=lfs merge=lfs -text
*.7z     filter=lfs diff=lfs merge=lfs -text

# DO NOT LFS: code & text
*.R    -text
*.py   -text
*.qmd  -text
*.md   -text
*.csv  -text
*.tsv  -text
*.yml  -text
*.yaml -text
*.json -text
```

**.gitignore** should keep bulky raw inputs out by default, but allow `1-inputs/11-knowledge-base/**` and **all** of `1-inputs/12-analytical-engine/**` to be tracked (reproducibility).

---

## 3) Daily workflow

```bash
# Stage a new large artifact (e.g., a PDF report)
git add 3-outputs/31-product-store/rogue-tap-v0.1.pdf
git commit -m "report: add Rogue TAP v0.1 (LFS)"
git push
```

Notes:

- You **do not** run `git lfs track` if the extension is already in `.gitattributes`.
- If you add a new extension, add it to `.gitattributes`, commit that change **first**, then add files of that type.

---

## 4) Cloning and pulling

- With LFS installed: `git clone` will fetch the repo, then LFS downloads the real binaries automatically.
- Without LFS installed: you will see small pointer files. After installing LFS, run:

```bash
git lfs pull
```

Selective fetch (optional):

```bash
git lfs fetch --include="*.pdf"
git lfs checkout
```

---

## 5) Verifying what you have

- Show attributes Git believes for a file:

  ```bash
  git check-attr filter diff merge text -- 3-outputs/31-product-store/rogue-tap-v0.1.pdf
  ```

- See whether a file in history is stored via LFS:

  ```bash
  git lfs ls-files
  ```

- View a pointer file (what you would get without LFS checkout):
  it contains lines like `version https://git-lfs.github.com/spec/v1`, `oid sha256`, and `size`.

---

## 6) Migrating already-committed large files into LFS

If large binaries were committed **before** LFS rules existed, rewrite history to move them into LFS:

```bash
# Danger: history rewrite. Coordinate with collaborators.
git lfs migrate import --include="*.pdf,*.docx,*.pptx,*.xlsx,*.png,*.jpg,*.jpeg,*.tif,*.tiff,*.svg,*.parquet,*.feather,*.rds,*.RData,*.gpkg,*.zip,*.ipynb,*.tar,*.tar.gz,*.7z"
git push --force-with-lease
```

Best practice: do this on a feature branch, validate, then fast-forward the default branch.

---

## 7) CI/CD, releases, and archives

- **GitHub Actions**: runners can `git lfs install` and will fetch LFS objects automatically on checkout (use `actions/checkout@v4` with `lfs: true`).
- **Releases**: attach built PDFs as release assets; LFS files in the repo count against LFS storage/bandwidth, release assets count against repository storage.
- **External archiving**: for long-term reproducibility, publish static releases (e.g., Zenodo/OSF) with a manifest file linking code commit hashes.

---

## 8) Storage & bandwidth quotas

- GitHub LFS has **storage** and **bandwidth** quotas (account-level). Monitor usage in repository **Settings - Packages - Git LFS**.
- Keep only necessary artifacts in the repo. Prefer one canonical PDF per release; archive older ones elsewhere if needed.

---

## 9) Troubleshooting

**Symptom:** PDFs appear as tiny text files with `version https://git-lfs`  
**Fix:** Install LFS and run `git lfs pull` (or `git lfs checkout`).

**Symptom:** Push rejected due to large file > 100 MB.  
**Fix:** Add the extension to `.gitattributes`, recommit with LFS, or migrate:

```bash
git reset --soft HEAD~1
git lfs track "*.pdf"           # or edit .gitattributes
git add .gitattributes
git add path/to/file.pdf
git commit -m "track pdf via LFS"
git push
```

**Symptom:** Team member can't fetch LFS objects.  
**Fix:** Ensure they have LFS installed and permission to the repo; then `git lfs pull`.

**Symptom:** CI step fails on checkout of LFS files.  
**Fix:** Use `actions/checkout@v4` with `lfs: true` and ensure network egress isn't blocked.

---

## 10) Security & integrity

- LFS files are tied to Git object IDs. Tampering is detectable via the pointer's SHA-256 `oid`.
- Treat LFS like regular repo content for access control: if someone can clone the repo, they can fetch its LFS objects.

---

## 11) Minimal checklist (copy/paste)

- [ ] `git lfs install` on every machine/runner.
- [ ] `.gitattributes` covers all heavy/binary extensions you produce.
- [ ] Code & text remain **out** of LFS.
- [ ] Verify with `git lfs ls-files` after commits.
- [ ] Use selective fetch if you don't need every artifact.
- [ ] Monitor LFS storage/bandwidth periodically.

---

## References

- `git help attributes`
- `git lfs help`, `git lfs migrate help`
- GitHub Docs: "Managing large files with Git LFS"
