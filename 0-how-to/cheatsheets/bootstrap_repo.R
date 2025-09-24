# How To Set Up a Reproducible Repository Structure for TAPs Implementation and Deployment
# One time only - Leveraging existing file structure from an original repo
# ---------- EDIT THESE ----------
source_dir <- "C:/Users/Username/.../taps-proj-mgmt"  # where the tree you showed lives
target_dir <- "C:/Users/Username/.../GitHub/taps-dev-rogue"  # or .../taps-dev-rogue
gh_org_or_user <- "guerrero-owrd"          # GitHub org or your username
# --------------------------------

################################################################################
# Pre-reqs once per machine:
# Required packages:
pkgs <- c("fs","usethis","gert","gh")
to_install <- pkgs[!pkgs %in% rownames(installed.packages())]
if(length(to_install)) install.packages(to_install, quiet=TRUE)
library(fs); library(usethis); library(gert); library(gh)

stopifnot(!grepl("OneDrive", target_dir, ignore.case = TRUE))

# Set your global Git identity (once)

# One-time global identity
install.packages(c("gert","usethis"), quiet = TRUE)  # safe if already installed
library(gert); library(usethis)
gert::git_config_global_set("user.name",  "Francisco J. Guerrero")
gert::git_config_global_set("user.email", "francisco.j.guerrero@water.oregon.gov") 

# Additional global configurations
gert::git_config_global_set("init.defaultBranch", "main")
gert::git_config_global_set("core.autocrlf", "true")         # Windows-friendly checkouts
gert::git_config_global_set("credential.helper", "manager-core")  # use Windows Cred Manager

# Create and store GitHub token
usethis::create_github_token()   # opens GitHub to make a PAT with 'repo' scope
gitcreds::gitcreds_set()          # paste the token; it’ll be saved securely

################################################################################

# File structure was initially created in Windows using the powershell. In this
# script we import the structure of it. Once the repository is created in GitHub
# This script would not be needed as the repo can be cloned directly (or used as
# a template)

# 1) Create target, copy clean tree
if (dir_exists(target_dir)) stop("Target exists. Pick a new target_dir or remove it.")
dir_create(target_dir)
exclude <- c(".Rproj.user",".git",".DS_Store","Thumbs.db")
all <- dir_ls(source_dir, recurse = TRUE, type = "any", all = TRUE)

# Clean out any path that includes excluded dirs anywhere in its full path
pattern_exclude <- paste0("(^|/)", gsub("\\.", "\\\\.", exclude), "($|/)", collapse = "|")
keep <- all[!grepl(pattern_exclude, all)]

# Prepare file list (after exclusions already defined)
rel_paths <- path_rel(keep, start = source_dir)
target_paths <- path(target_dir, rel_paths)

# Ensure destination folders exist
dir_create(unique(path_dir(target_paths)))

# Copy with base R
ok <- file.copy(keep, target_paths, overwrite = TRUE, recursive = TRUE)

# Check for failures
if (!all(ok)) warning("Some files failed to copy: ", paste(rel_paths[!ok], collapse = ", "))

# Final Verification of files copied (optional, but recommended)
library(fs)

exclude <- c(".Rproj.user",".git",".DS_Store","Thumbs.db")
pattern_exclude <- paste0("(^|/)", gsub("\\.", "\\\\.", exclude), "($|/)", collapse = "|")

src  <- dir_ls(source_dir, recurse = TRUE, type = "file", all = TRUE)
src  <- src[!grepl(pattern_exclude, src)]
tgt  <- path(target_dir, path_rel(src, start = source_dir))

# a) Missing files?
missing <- tgt[!file_exists(tgt)]
length(missing); head(path_rel(missing, start = target_dir), 20)

# b) Size mismatches?
si <- file_info(src)$size
ti <- file_info(tgt)$size
mismatch <- which(si != ti)
length(mismatch); head(path_rel(src[mismatch], start = source_dir), 20)

# 2) Become the target
o <- getwd(); setwd(target_dir); on.exit(setwd(o), add = TRUE)

# 3) Add (or refresh) an RStudio project file
if (!any(grepl("\\.Rproj$", fs::dir_ls(".", type="file")))) usethis::use_rstudio(open = FALSE)

# 4) Git init + sane ignores
gert::git_init()
writeLines(c(
  "# R / RStudio",".Rproj.user/",".Rhistory",".RData",".Ruserdata",
  "# OS noise",".DS_Store","Thumbs.db",
  "# Quarto/Rmd cache","*_cache/","_cache/","*.knit.md","*.utf8.md","*.html",
  "# Outputs & reports (keep README)","3-outputs/31-product-store/*","!3-outputs/31-product-store/README.md",
  "2-processes/21-production-hub/reports/*","!2-processes/21-production-hub/reports/README.md",
  "# Raw inputs generally excluded unless whitelisted","1-inputs/**",
  "!1-inputs/11-knowledge-base/**",
  "!1-inputs/12-analytical-engine/README.md",
  "!1-inputs/12-analytical-engine/schedule.csv",
  "!1-inputs/12-analytical-engine/staff_time.csv"
), ".gitignore")

# Optional: Git LFS for heavy docs
try(system("git lfs install"), silent=TRUE)
try(system('git lfs track "*.pdf" "*.docx"'), silent=TRUE)

# 5) Snapshot a tree map for collaborators
capture.output(fs::dir_tree(".", recurse = TRUE), file = "repo_structure.txt")

# 6) First commit
gert::git_add(".")
gert::git_commit("Bootstrap: copied tree, .Rproj, .gitignore, structure snapshot")

# 7) Create GitHub repo and push main
# If this is an org, ensure your PAT has org:admin/repo scopes as needed
usethis::use_github(protocol = "https", 
           private = FALSE
           )

# 8) Save a copy of this script and write the how-to
dir_create("0-how-to/cheatsheets")

# Manually copy the saved script you're working in
file.copy("bootstrap_repo.R", "0-how-to/cheatsheets/bootstrap_repo.R", overwrite = TRUE)

# Write GitHub how-to
howto <- c(
  "# How-to: Initialize and publish this repo from RStudio",
  "",
  "1. Edit `source_dir`, `target_dir`, and `gh_org_or_user` in `0-how-to/cheatsheets/bootstrap_repo.R`.",
  "2. Run the script in any R session (best outside OneDrive). It will:",
  "   - Copy the clean TAPs tree",
  "   - Create a `.Rproj` file",
  "   - Initialize Git and GitHub",
  "   - Set up `.gitignore`, LFS, and tree snapshot",
  "",
  "3. After structure changes, re-run this to update `repo_structure.txt`:",
  "```r",
  "fs::dir_tree('.', recurse = TRUE) |> capture.output(file = 'repo_structure.txt')",
  "```"
)
writeLines(howto, "0-how-to/cheatsheets/github-repo-setup.md")

message("\n✅ Done. Open the new .Rproj under: ", target_dir, "\n")



# 8) Save this script and a short how-to into the repo
dir_create("0-how-to/cheatsheets")

# Save this script for future use (only if sourced)
if (interactive()) {
  writeLines(readLines(sys.calls()[[1]][[1]]), "0-how-to/cheatsheets/bootstrap_repo.R")
}

writeLines(readLines(sys.calls()[[1]][[1]]), "0-how-to/cheatsheets/bootstrap_repo.R")
howto <- c(
  "# How-to: Initialize and publish this repo from RStudio",
  "",
  "1. Edit `source_dir`, `target_dir`, `gh_org_or_user` in `0-how-to/cheatsheets/bootstrap_repo.R`.",
  "2. Run it from any R session. It will copy the project outside OneDrive, create a `.Rproj`,",
  "   init git, add ignores, create the GitHub repo, push `main`, and write `repo_structure.txt`.",
  "3. Close RStudio and reopen the new `.Rproj` at the target path.",
  "",
  "After any structure change, refresh the tree:",
  "```r",
  "fs::dir_tree('.', recurse = TRUE) |> capture.output(file = 'repo_structure.txt')",
  "```"
)
writeLines(howto, "0-how-to/cheatsheets/github-repo-setup.md")

message("\nDone. Open the new .Rproj under: ", target_dir, "\n")