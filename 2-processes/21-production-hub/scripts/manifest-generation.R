# Create folder for manifests
dir.create("2-processes/21-production-hub/manifests", recursive = TRUE, showWarnings = FALSE)

# All 12 core files: file name + intended repo path
core_files <- data.frame(
  file_name = c(
    # Knowledge base (8)
    "pbp_key_definitions.md",
    "pbp_rules_insights.md",
    "taps_charter_core_framework.md",
    "taps_charter_governance_roles.md",
    "taps_charter_risks_mitigations.md",
    "taps_charter_decision_requests.md",
    "taps_charter_roadmap_milestones.md",
    "taps_charter_proposal_appendices.md",
    # Core dev docs (4)
    "snapshot-caveat.md",
    "schema_mockups_v0_1.md",
    "data_dictionary_min.md",
    "banner_provenance.md"
  ),
  dest_relpath = c(
    # Knowledge base → keep under 11-knowledge-base
    "1-inputs/11-knowledge-base/pbp_key_definitions.md",
    "1-inputs/11-knowledge-base/pbp_rules_insights.md",
    "1-inputs/11-knowledge-base/taps_charter_core_framework.md",
    "1-inputs/11-knowledge-base/taps_charter_governance_roles.md",
    "1-inputs/11-knowledge-base/taps_charter_risks_mitigations.md",
    "1-inputs/11-knowledge-base/taps_charter_decision_requests.md",
    "1-inputs/11-knowledge-base/taps_charter_roadmap_milestones.md",
    "1-inputs/11-knowledge-base/taps_charter_proposal_appendices.md",
    # Core dev docs in their working locations
    "0-how-to/cheatsheets/snapshot-caveat.md",
    "1-inputs/12-analytical-engine/schema_mockups_v0_1.md",
    "1-inputs/12-analytical-engine/data_dictionary_min.md",
    "3-outputs/33-templates/banner_provenance.md"
  ),
  enabled = TRUE,
  stringsAsFactors = FALSE
)

write.csv(core_files,
          "2-processes/21-production-hub/manifests/core-files.csv",
          row.names = FALSE)

message("Wrote: 2-processes/21-production-hub/manifests/core-files.csv")

################################################
# Audit core files against the manifest
if (!requireNamespace("fs", quietly = TRUE)) install.packages("fs")
if (!requireNamespace("digest", quietly = TRUE)) install.packages("digest")
library(fs); library(digest)

mf_path <- "2-processes/21-production-hub/manifests/core-files.csv"
stopifnot(file_exists(mf_path))
mf <- read.csv(mf_path, stringsAsFactors = FALSE)

audit <- lapply(seq_len(nrow(mf)), function(i){
  p <- mf$dest_relpath[i]
  present <- file_exists(p)
  data.frame(
    file_name   = mf$file_name[i],
    dest_relpath= p,
    present     = present,
    size_bytes  = if (present) file_info(p)$size else NA_real_,
    sha256      = if (present) digest(file = p, algo = "sha256") else NA_character_,
    mtime       = if (present) as.character(file_info(p)$modification_time) else NA_character_,
    stringsAsFactors = FALSE
  )
})
audit <- do.call(rbind, audit)

dir_create("2-processes/21-production-hub/manifests", recurse = TRUE)
write.csv(audit, "2-processes/21-production-hub/manifests/core-files-status.csv", row.names = FALSE)

cat("\nAudit summary:\n")
print(with(audit, table(present)))
missing <- subset(audit, !present)
if (nrow(missing)) {
  cat("\nMissing files (fix these):\n")
  print(missing[, c("file_name","dest_relpath")], row.names = FALSE)
} else {
  cat("\nAll core files present. Nice.\n")
}


