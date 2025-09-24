# Minimal Data Dictionary

| Field            | Type    | Description                                   |
|------------------|---------|-----------------------------------------------|
| huc10            | string  | 10-digit watershed code                        |
| date             | date    | SW daily index (YYYY-MM-DD)                    |
| year             | int     | WR annual rollups                              |
| quarter          | string  | GW quarter (YYYY-Qn)                           |
| q_cms            | numeric | Discharge (m^3/s)                              |
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

