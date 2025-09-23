# generate_core_files.R
# Creates/updates four core TAPs dev files.
# Usage:
#   source("2-processes/21-production-hub/scripts/generate-core-files.R")
#   generate_core_files()           # create if missing
#   generate_core_files(force=TRUE) # overwrite with current templates

generate_core_files <- function(force = FALSE) {
  if (!requireNamespace("fs", quietly = TRUE)) install.packages("fs", quiet = TRUE)
  library(fs)
  
  targets <- list(
    "0-how-to/cheatsheets/snapshot-caveat.md" = 
      "# Snapshot Caveat — v0.1
**Banner:** Illustrative Pilot — Not Production Data. Not for enforcement.

## Purpose
Screening-level literacy aid; clarifies scope, limits, and provenance for TAPs pilot work.

## Data sources (fill before release)
- OWRD public systems: WRIS/SWARS/GWIS — manual export dates: <YYYY-MM-DD>
- USGS NWIS / NWM references: <links or DOIs>
- Any third-party layers: <names, versions>

## Assumptions & gaps
- Manual pulls; schemas may diverge from future IT snapshots (planned 2026).
- Public-only data; upstream regeneration may not reproduce pilot numbers exactly.
- Spatial unit: HUC-10; coverage skew toward upper basin gages.

## Methods scope (screening-level)
- **SW:** regime clusters, trend sign/magnitude; ENSO linkage stub only.
- **WR:** totals, dominant use, use heterogeneity (H*), seniority percentiles.
- **GW:** monitoring coverage/gaps; no trend claims without formal QA.

## Provenance & reproducibility
Frozen inputs will be archived externally (Zenodo/OSF) with SHA-256 checksums.
This repo stores code, manifest, and caveats; strict reproducibility awaits IT snapshots.

## Contacts
Owner: F. Guerrero (PCI). Review: TAPs Working Group. Non-regulatory literacy product.
",
    
    "1-inputs/12-analytical-engine/schema_mockups_v0_1.md" =
      "# Schema Mock-ups v0.1

## Join keys
- **huc10**: string (10-digit), CRS EPSG:5070 for vector overlays
- **time**: `date` (SW daily), `year` (WR annual), `quarter` (GW YYYY-Qn)

## Surface Water (SW) — daily
Fields:
- huc10, date, q_cms, source[USGS|NWM], gage_type[observed|modeled], coverage_flag[none|partial|full]

Notes:
- `source` distinguishes observed vs modeled provenance.
- `coverage_flag` feeds representativeness maps.

## Water Rights (WR) — annual rollups + detail
Detail fields:
- right_id, huc10, year, use_type, volume_afy, priority_date, status, instream_flag

Aggregates (by huc10-year):
- total_volume_afy, dominant_use, H_star, seniority_p10, seniority_p50, seniority_p90

## Groundwater (GW) — quarterly
Observation fields:
- huc10, quarter, well_id, screen_top_m, screen_bot_m, water_level_masl, well_use, quality_flag

Coverage (by huc10-quarter):
- obs_wells, coverage_class[none|sparse|moderate|good]

## Constraints
- Public data only; no sensitive wells/locations.
- These mock-ups emulate future snapshot structures for wiring and chart stubs.
",
    
    "1-inputs/12-analytical-engine/data_dictionary_min.md" =
      "# Minimal Data Dictionary

| Field            | Type    | Description                                   |
|------------------|---------|-----------------------------------------------|
| huc10            | string  | 10-digit watershed code                        |
| date             | date    | SW daily index (YYYY-MM-DD)                    |
| year             | int     | WR annual rollups                              |
| quarter          | string  | GW quarter (YYYY-Qn)                           |
| q_cms            | numeric | Discharge (m³/s)                               |
| source           | enum    | USGS or NWM                                    |
| gage_type        | enum    | observed or modeled                            |
| coverage_flag    | enum    | none, partial, full (SW representativeness)    |
| right_id         | string  | Unique water-right identifier                  |
| use_type         | enum    | ag, muni, industrial, instream, other          |
| volume_afy       | numeric | Volume (acre-feet per year)                    |
| priority_date    | date    | Seniority date                                 |
| status           | enum    | active, suspended, etc.                        |
| instream_flag    | bool    | 1 if instream right                            |
| total_volume_afy | numeric | Sum by huc10-year                              |
| dominant_use     | enum    | Modal use_type by huc10-year                   |
| H_star           | numeric | Normalized use-diversity index                 |
| seniority_p10    | date    | 10th percentile priority date                  |
| seniority_p50    | date    | Median priority date                           |
| seniority_p90    | date    | 90th percentile priority date                  |
| well_id          | string  | Well identifier                                |
| screen_top_m     | numeric | Well screen top (m)                            |
| screen_bot_m     | numeric | Well screen bottom (m)                         |
| water_level_masl | numeric | Water level (m a.s.l.)                         |
| well_use         | enum    | municipal, irrigation, monitoring, other       |
| quality_flag     | enum    | ok, suspect                                    |
| obs_wells        | int     | Count of wells in coverage table               |
| coverage_class   | enum    | none, sparse, moderate, good (GW coverage)     |
",
    
    "3-outputs/33-templates/banner_provenance.md" =
      "**Illustrative Pilot — Not Production Data. Not for enforcement or permitting.**  
Data are public and may change without notice. Methods are screening-level; results are not reproducible from OWRD snapshot infrastructure until snapshots resume (planned 2026). Provenance and frozen-input DOIs will be provided."
  )
  
  wrote <- character()
  skipped <- character()
  
  for (p in names(targets)) {
    dir_create(path_dir(p), recurse = TRUE)
    if (!file_exists(p) || force) {
      writeLines(targets[[p]], p)
      wrote <- c(wrote, p)
    } else {
      skipped <- c(skipped, p)
    }
  }
  
  # Snapshot the tree so collaborators see what's new
  capture.output(fs::dir_tree(".", recurse = TRUE), file = "repo_structure.txt")
  
  message("Files written: ", if (length(wrote)) paste(wrote, collapse = ", ") else "(none)")
  if (length(skipped) && !force) message("Skipped (exists, use force=TRUE to overwrite): ", paste(skipped, collapse = ", "))
  invisible(list(written = wrote, skipped = skipped))
}

