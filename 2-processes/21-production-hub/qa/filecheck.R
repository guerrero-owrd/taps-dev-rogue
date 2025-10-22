# file: 2-processes/21-production-hub/qa/filecheck.R
# Purpose: verify key TAPs-PM artifacts exist and capture mtimes for logging.
# Usage: Rscript 2-processes/21-production-hub/qa/filecheck.R

repo_root <- normalizePath(".", winslash = "/")
message("Repo root: ", repo_root)

## 1) declare expected artifacts from the 2025-09-08 note
must_exist <- c(
  "1-inputs", "2-processes", "3-outputs", "4-memory",
  "0-how-to/cheatsheets",                                   # helper docs
  "3-outputs/33-templates",                                 # templates bucket
  "2-processes/21-production-hub/notes",                    # notes hub
  "2-processes/23-decision-log/decisions.csv",
  "2-processes/24-risk-register/risk_log.csv",
  "1-inputs/12-analytical-engine/schedule.csv",
  "1-inputs/12-analytical-engine/staff_time.csv"
)

should_exist <- c(
  "0-how-to/cheatsheets/snapshot-caveat.md",                # cheat-sheet v0.1
  "3-outputs/33-templates/snapshot-caveat.md",              # template file
  "2-processes/21-production-hub/notes/2025-09-09_session.md",
  "2-processes/21-production-hub/rogue_pilot/scope.md",     # pilot scope doc (name may vary)
  "2-processes/21-production-hub/rogue_pilot/schema_mockups_v0.1.md",
  "2-processes/21-production-hub/rogue_pilot/data_dictionary.md",
  "3-outputs/31-product-store/banner_snippets.md"           # banner/provenance text
)

## 2) helper to check paths and mtimes
check_paths <- function(paths, label){
  info <- file.info(paths)
  df <- data.frame(
    category = label,
    path     = paths,
    exists   = !is.na(info$size),
    is_dir   = info$isdir %in% TRUE,
    size_b   = ifelse(is.na(info$size), NA_real_, info$size),
    modified = as.POSIXct(info$mtime, tz = Sys.timezone()),
    row.names = NULL
  )
  df[order(df$exists, df$modified, decreasing = TRUE), ]
}

## 3) run checks
res_must   <- check_paths(must_exist,   "MUST")
res_should <- check_paths(should_exist, "SHOULD")
status_tbl <- rbind(res_must, res_should)

## 4) show results and write a quick CSV for your note
print(status_tbl, row.names = FALSE)
out_csv <- "2-processes/21-production-hub/notes/2025-10-21_filecheck.csv"
dir.create(dirname(out_csv), recursive = TRUE, showWarnings = FALSE)
write.csv(status_tbl, out_csv, row.names = FALSE)
cat("\nWrote:", out_csv, "\n")

## 5) optional: what changed in last 30 days across Processes
recent <- function(root="2-processes", days=30, n=50){
  all <- list.files(root, full.names=TRUE, recursive=TRUE, all.files=FALSE)
  info <- file.info(all)
  df <- data.frame(path=all, modified=info$mtime, size_b=info$size, is_dir=info$isdir)
  df <- subset(df, !is_dir & modified >= (Sys.time() - as.difftime(days, units="days")))
  df[order(df$modified, decreasing=TRUE), ][seq_len(min(n, nrow(df))), ]
}
cat("\nRecent changes (<=30d) in 2-processes:\n")
print(recent(), row.names = FALSE)

## 6) optional: last git commit touching a file (if repo is under git)
git_last_touch <- function(p){
  if(!file.exists(p)) return(data.frame(path=p, git="MISSING"))
  cmd <- sprintf('git log -1 --format="%%h | %%ci | %%an" -- "%s"', p)
  out <- tryCatch(system(cmd, intern=TRUE), error=function(e) NA_character_)
  data.frame(path=p, git=ifelse(length(out), out, NA_character_))
}
git_report <- do.call(rbind, lapply(unique(c(must_exist, should_exist)), git_last_touch))
cat("\nGit last-touch (if available):\n")
print(git_report, row.names = FALSE)
