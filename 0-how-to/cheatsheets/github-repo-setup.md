# How-to: Initialize and publish this repo from RStudio

1. Edit `source_dir`, `target_dir`, and `gh_org_or_user` in `0-how-to/cheatsheets/bootstrap_repo.R`.
2. Run the script in any R session (best outside OneDrive). It will:
   - Copy the clean TAPs tree
   - Create a `.Rproj` file
   - Initialize Git and GitHub
   - Set up `.gitignore`, LFS, and tree snapshot

3. After structure changes, re-run this to update `repo_structure.txt`:
```r
fs::dir_tree('.', recurse = TRUE) |> capture.output(file = 'repo_structure.txt')
```
