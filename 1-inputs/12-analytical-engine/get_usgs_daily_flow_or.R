# ------------------------------------------------------------------------
# SCRIPT NAME: get_usgs_daily_flow_or.R
# ------------------------------------------------------------------------
# DESCRIPTION:
# Downloads daily streamflow (discharge) records from the USGS NWIS system
# for Hydro-Climatic Data Network (HCDN-2009) gaging stations located in Oregon.
# This script filters from the national HCDN gage list, queries available data,
# and saves each site’s discharge record as a CSV file.
#
# This script is part of the COMID-QA project and supports the evaluation
# of NWM and NHM-PRMS streamflow outputs against observed USGS data.
#
# ------------------------------------------------------------------------
# INPUTS:
# - Excel file: HCDN-2009_Station_Info.xlsx
#   [Located in: 1_knowledge-base/datasets/raw_data/hdcn_2009/data/]
#
# OUTPUTS:
# - One CSV per gage: USGS_[siteID]_daily.csv
#   [Saved to: 2_analytical-engine/COMID-QA/data/hdcn-data/]
#
# REQUIREMENTS:
# - Packages: dataRetrieval, dplyr, lubridate, janitor, etc.
# - Access to NWIS web services
#
# AUTHOR: Francisco J. Guerrero
# DATE CREATED: [insert today's date]
# LAST UPDATED: [insert latest update]
# ------------------------------------------------------------------------


# 0) If you haven't already, install the "librarian" package to manage your packages.
#    You can install it with: install.packages("librarian")
#    This script uses the "shelf" function to load packages.
#    The "shelf" function will install any missing packages for you.
#    If you don't want to use "librarian", you can manually install and load the packages below.
#    Uncomment the lines below to install the required packages.

# install.packages("librarian")

# 1. Install & load required packages
librarian::shelf(dataRetrieval,# for downloading data from NWIS
                 dplyr,# for data manipulation
                 lubridate,# for date manipulation
                 stringr,# for string manipulation
                 readr,# for reading data
                 purrr,# for functional programming
                 tidyr,# for data tidying
                 here,# for file paths
                 readxl, # for reading Excel files
                 janitor)# for cleaning column names

# 2. Read in your station list
# I use the "here" package to set the working directory to the project root.
# This assumes you have a "data" folder in your project root.
# You can change the path to your station list as needed.
# If you have a .csv file, use read_csv() instead of read_excel().
# If you have a .xlsx file, use read_excel() instead of read_csv().
# If you have a .tsv file, use read.table() with sep = "\t".
# If you have a .txt file, use read.table() with sep = "\t" or sep = " ".


stations <- readr::read_csv(here::here("..", "1_knowledge-base", "datasets", "raw_data", "hdcn_2009", "data", "hdcn_2009_gages_full.csv")) %>%
  janitor::clean_names()


# 3. Filter to Oregon stations
or_stations <- subset(stations, state == "OR")
site_ids <- or_stations$station_id

# 4) Check for duplicates
duplicates <- site_ids[duplicated(site_ids)]
if (length(duplicates) > 0) {
  message("Duplicate site IDs found: ", paste(duplicates, collapse = ", "))
} else {
  message("No duplicate site IDs found.")
}

# 5. Query USGS metadata for daily discharge availability (00060)
meta <- whatNWISdata(siteNumber = site_ids,
                     service = "dv",
                     parameterCd = "00060")

# 6. Filter for valid records with non-missing dates
meta_clean <- meta[!is.na(meta$begin_date) & !is.na(meta$end_date), ]

# Optional: limit to unique site/parameter combinations
meta_clean <- unique(meta_clean[, c("site_no", "begin_date", "end_date")])

# 7. Download data for each site and save as CSV
output_dir <- here::here("2_analytical-engine", "data", "hdcn-data")

# Create folder if missing
if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE)


for (i in seq_len(nrow(meta_clean))) {
  site <- meta_clean$site_no[i]
  startDate <- meta_clean$begin_date[i]
  endDate   <- meta_clean$end_date[i]
  
  message(sprintf("Downloading site %s (%s to %s)...", site, startDate, endDate))
  
  tryCatch({
    df <- readNWISdv(siteNumbers = site,
                     parameterCd = "00060",
                     startDate   = startDate,
                     endDate     = endDate)
    
    # Save output to CSV
    out_file <- file.path(output_dir, sprintf("USGS_%s_daily.csv", site))
    write.csv(df, file = out_file, row.names = FALSE)
    message("  → Saved to ", out_file)
  }, error = function(e) {
    warning("  ! Failed for site ", site, ": ", conditionMessage(e))
  })
}

message("✅ All downloads complete.")



  
  
  
  
  
  
  
  
  
  