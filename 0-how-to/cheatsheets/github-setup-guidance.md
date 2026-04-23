# TAPS GitHub Setup & Workflow Guidance

Last updated: April 22, 2026

A practical cheat sheet for contributors to the taps-dev-rogue repository.

## 1. Install Git

### Windows

Download: <https://git-scm.com/download/win>
Git for Windows includes Git Bash + Git Credential Manager.
Verify installation
Shellgit --versionShow more lines

## 2. Configure Git Identity (one time)

```Shell
git config --global user.name "First Last"
git config --global user.email "your_email@yourdomain"
git config --global init.defaultBranch mainShow more lines
```

## 3. GitHub Authentication (Best Practices)

GitHub supports two secure methods:

### Option A — Git Credential Manager (Recommended)

Git Credential Manager (GCM) handles OAuth flow through browser or device code.

During your first push/pull:

- Select Sign in with browser
- If restricted environment → Sign in with a code (device flow)
- Complete GitHub login & 2FA
- GCM stores a secure token automatically

Check your credential helper:

```Shell
git config --global credential.helper
```

- It Should be:manager
- Avoid old / broken helper: manager-core   # ❌ outdated

If wrong:

```Shell
git config --global --unset-all credential.helper
git config --global credential.helper manager
```

### Option B — SSH Keys (No browser needed)

```Shell
ssh-keygen -t ed25519 -C "your_email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Add your public key in GitHub → Settings → SSH and GPG keys

Set SSH remote:

```Shell
git remote set-url origin git@github.com:<org>/<repo>.git
```

## 4. Never Commit Secrets

GitHub’s Push Protection detects:

- Personal Access Tokens (PATs)
- API keys
- Private keys
- Cloud credentials
- Anything that looks sensitive

If GitHub blocks your push:
Fix it:

- Remove the secret from the working tree
- Amend the commit:

```Shell
git commit --amend --no-edit
```

- If the secret is in earlier commits:

```Shell
git reset --soft <GOOD_COMMIT>
```

- Force‑push clean history:

```Shell
git push --force-with-lease
```

## 5. Standard Git Workflow

```Shell
# 1. Check status:
git status
# 2. Stage changes:
git add
# 3. Commit
git commit -m "message"
# 4. Push
git push
```

## 6. Branch Workflow (Recommended for Collaborative Work)

```Shell
git checkout -b feature/<topic>
git push -u origin feature/<topic>
```

## 7. Recommended .gitignore

```md
# OS / editor files
.DS_Store
Thumbs.db

# R
.Rhistory
.RData
.Rproj.user/

# Python
__pycache__/
*.pyc
.ipynb_checkpoints/

# Credentials / secrets
*.env
*.env.*
*.ini
*.key
*.pem
*.crt
secrets/
tokens/

# Misc
*.bak
*.tmp
```

## 8. Fixing Common Issues

❌ “Invalid username or token”: Token expired or stale → clear credentials:

```Shell
printf "protocol=https\nhost=github.com\n\n" | git credential-manager --no-ui 
```

Push again and re-auth.

❌ “credential-manager-core is not a git command” Fix helper:

```Shell
git config --global --unset-all credential.helper
git config --global credential.helper manager
```

❌ Secret scanning block
Remove secret → rewrite commit → force-push.

## 9. Repo Hygiene Recommendations

- Protect main with branch protection rules
- Require PR reviews for important changes
- Keep large data files outside Git
- Use semantic tagging for releases:

```Shell
git tag -a v0.1.0 -m "Initial version"
git push origin v0.1.0
```


## 10. Contact / Support

For issues with authentication, repo access, or tooling:

- Ask your technical support group
- Or consult GitHub Docs: <https://docs.github.com>

## End of File
