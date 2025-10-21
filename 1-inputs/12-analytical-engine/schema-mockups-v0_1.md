# Schema Mock-ups v0.1

## Join keys

- **huc10**: string (10-digit), CRS EPSG:5070 for vector overlays
- **time**: `date` (SW daily), `year` (WR annual), `quarter` (GW YYYY-Qn)

## Surface Water (SW) - daily

Fields

- huc10, date, q_cfs, source[USGS|NWM], gage_type[observed|modeled], coverage_flag[none|partial|full]

Notes:

- `source` distinguishes observed vs modeled provenance.
- `coverage_flag` feeds representativeness maps.

## Water Rights (WR) - annual rollups + detail

Detail fields:

- right_id, huc10, year, use_type, volume_afy, priority_date, status, instream_flag

Aggregates (by huc10-year):

- total_volume_afy, dominant_use, H_star, seniority_p10, seniority_p50, seniority_p90

## Groundwater (GW) - quarterly

Observation fields:

- huc10, quarter, well_id, screen_top_m, screen_bot_m, water_level_masl, well_use, quality_flag

Coverage (by huc10-quarter):

- obs_wells, coverage_class[none|sparse|moderate|good]

## Constraints

- Public data only; no sensitive wells/locations.
- These mock-ups emulate future snapshot structures for wiring and chart stubs.
