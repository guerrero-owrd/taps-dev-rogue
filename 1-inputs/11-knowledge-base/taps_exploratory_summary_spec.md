# TAPs Exploratory & Summary Analyses (Code‑Generated) — Specification
**Illustrative — not for enforcement**

This document defines the code‑generated analyses and summary outputs that feed TAPs. It also lists the public data sources required to build them. Everything here is reproducible and intended for automation across HUC‑10 units by default, with HUC‑8 fallback when data are sparse.

---

## 1) Scope and Decision Rules
- **Default reporting unit:** HUC‑10.  
- **Fallback:** Use HUC‑8 for any layer where coverage density falls below threshold (e.g., GW wells, rights geometry).  
- **Reference periods:** configurable; defaults: `POR = 1980–present`, `Climatology = 1991–2020`.  
- **Regulatory boundary:** No use/diversion accounting. Rights are summarized as *attributes*, not “use.”

---

## 2) Exploratory Analyses (EDA) — Code Outputs
These are diagnostic and may not appear in the public report. They gate what we can safely summarize.

### 2.1 Data Coverage & QA
- **Tables**
  - `eda_data_inventory.csv` — per unit, dataset presence, record length, gaps.
  - `eda_gage_coverage.csv` — gaged drainage area share, regulation flags.
- **Plots**
  - `eda_missingness_heatmap.png` — daily coverage (flow series) by site.
  - `eda_record_length_hist.png` — distribution of gage POR by unit.
- **Checks**
  - Time monotonicity, duplicate timestamps, negative flows, unit consistency.

### 2.2 Terrain & Geometry
- **Tables**
  - `terrain_hypsometry_bins.csv` — elevation bins, area share, CDF.
  - `terrain_stats.csv` — elev P10/50/90, slope P50/P90, relief.
- **Plots**
  - `fig_hypsometric_curve.png` — cumulative area vs elevation.
  - `fig_slope_boxplot.png` — slope distribution by unit.

### 2.3 Climate & Snow
- **Tables**
  - `clim_monthly_normals.csv` — P and T normals by month and unit.
  - `snow_daily_quantiles.csv` — median and IQR of SWE by DOY.
- **Plots**
  - `fig_climate_seasonality.png` — monthly P/T with spatial ribbons.
  - `fig_swe_envelope.png` — Nov–Jul SWE median band.

### 2.4 Hydrography & Flow
- **Tables**
  - `flow_sites_inventory.csv` — site IDs, drainage area, regulation notes.
  - `flow_climatology.csv` — monthly means by site and unit.
  - `flow_variability_indices.csv` — CV, 7Q2 proxies, BFI estimates.
  - `flow_trend_tests.csv` — Mann–Kendall/Sen results for annual metrics.
- **Plots**
  - `fig_median_daily_hydrograph.png` — median with IQR, exemplar years.
  - `fig_flow_duration_curves.png` — per site with area normalization.
  - `fig_trend_small_multiples.png` — decadal trends for key stats.

### 2.5 Storage & Reservoir Context (Descriptive)
- **Tables**
  - `storage_catalog.csv` — reservoir name, capacity, primary purpose.
  - `storage_stage_summary.csv` — stage range, indicative ET (method noted).
- **Plots**
  - `fig_storage_vs_inflow_ratio.png` — capacity to mean inflow proxy.

### 2.6 Rights Attributes (Descriptive, Non‑Regulatory)
- **Tables**
  - `rights_counts_by_use.csv` — counts and nominal rates/duties by use class.
  - `rights_priority_hist.csv` — decade histogram by use class.
  - `rights_instream_overlays.csv` — scenic/withdrawn reach intersections.
- **Plots**
  - `fig_rights_priority_stack.png` — evolution of “character of rights.”
  - `fig_rights_type_share.png` — share of municipal/irrigation/instream.

---

## 3) Summary Analyses — Public‑Facing Ready
Condensed, standardized outputs intended for the TAPs technical report.

### 3.1 Terrain & Climate Summary
- **Table S1: Terrain & Climate** — elev P10/50/90, slope P50, mean annual P and T (with period).
- **Figure S1: Terrain Summary** — hypsometric curve + slope boxplot.
- **Figure S2: Climate Seasonality** — monthly P and T normals with ribbons.

### 3.2 Hydrology Summary
- **Table S2: Flow Metrics** — mean annual flow, CV, BFI, 7‑day minima/maxima (POR and recent window).  
- **Figure S3: Monthly Flow Profiles** — mean or median monthly discharge by key sites.  
- **Figure S4: Median Daily Hydrograph** — median with IQR and one exemplar year.  
- **Optional**: Trend markers for key metrics with Sen slope (▲▼ = sign and magnitude class).

### 3.3 Storage & Water‑Rights Context (Non‑Regulatory)
- **Table S3: Storage Inventory** — capacity, flood control allocation, indicative stage range.
- **Table S4: Rights Character** — counts and nominal authorized rates by use type and priority decade.  
- **Figure S5: Rights Evolution** — stacked area of use types by priority decade.

### 3.4 Data Coverage & Caveats
- **Table S5: Coverage Summary** — gage POR years, percent gaged area, datasets used.  
- **Figure S6: Coverage Heatmap** — site‑by‑time completeness panel.

---

## 4) Methods — Algorithms and Defaults
- **Hypsometry:** zonal histogram of DEM, CDF plotted; bin width 25–50 m depending on relief.  
- **Slope:** `terrain(DEM, v="slope")`, degrees; summarize by quantiles.  
- **Climate normals:** PRISM monthly normals; if time series used, compute 1991–2020 means.  
- **SWE envelope:** daily medians from SNODAS or equivalent; report grid resolution in caption.  
- **Flow climatology:** daily to DOY median per site; interquartile envelope across POR.  
- **Variability:** coefficient of variation on annual totals; report POR used.  
- **BFI:** Lyne–Hollick recursive filter (α=0.925); sensitivity ±0.02 reported when displayed.  
- **Trends:** Mann–Kendall with Sen slope on annual stats; flag n<20 as “insufficient length.”  
- **Rights summaries:** counts and nominal authorized rates/duties by use class and decade; no diversion/use inference.

---

## 5) QA & Guardrails
- **Unit coherence:** all flows in cfs, volumes in taf, elevation in meters (or clearly labeled).  
- **Representativeness flag:** mark units where gages cover <40% of area.  
- **Regulation confound:** label sites influenced by reservoirs/diversions.  
- **Grid disclaimer:** show native grid size for PRISM/SWE; use “indicative” language for coarse inputs.  
- **Non‑regulatory banner:** all outputs include “Illustrative — not for enforcement.”

---

## 6) Required Public Data Sources
List includes minimum viable stack. Use most current versions available.

### Terrain & Boundaries
- **USGS 3DEP DEM** (10–30 m): elevation and slope derivations.  
- **USGS WBD** (HUC‑8/10): hydrologic unit boundaries.  
- **NHDPlus High Resolution**: flowlines, waterbodies, catchments.

### Climate & Snow
- **PRISM Climate Group**: monthly precipitation and temperature normals/time series.  
- **SNODAS** (or equivalent): daily SWE grids for snow season envelopes.  
- **Daymet/GRIDMET (optional)**: daily climate for potential ET proxy if needed.

### Surface Water
- **USGS NWIS**: daily streamflow for gaging stations (POR metadata, regulation flags).  
- **NOAA National Water Model (Retrospective)**: modeled flow series for ungaged context (clearly labeled as modeled).

### Storage & Dams
- **National Inventory of Dams (USACE)**: reservoir attributes (capacity, purpose).  
- **Operator time series (when public)**: stage/flow for major reservoirs (citation in captions).

### Land Cover / Irrigated Fields (Contextual)
- **NLCD/LCMAP**: land‑cover composition.  
- **State/County field boundaries or CDL**: irrigated acreage overlays (descriptive only).

### Rights Attributes (Non‑Regulatory)
- **WRDB (public exports or approved snapshots)**: rights use class, rate, duty, priority date, POD/POU geometry, scenic/withdrawn overlays.  
  - Use for **character‑of‑rights summaries only**; no use/diversion analytics.

---

## 7) Deliverables and Filenames (by HUC Unit)
- `S1_terrain_climate_{unit}.png`  
- `S2_climate_seasonality_{unit}.png`  
- `S3_monthly_flows_{unit}.png`  
- `S4_median_hydrograph_{unit}.png`  
- `S5_rights_evolution_{unit}.png`  
- `S_tables_{unit}.csv` (S1–S5 tables combined)  
- `coverage_heatmap_{unit}.png`  
- `metadata_{unit}.json`

---

## 8) Configuration Parameters (YAML)
```yaml
unit_scale: HUC10
fallback_scale: HUC8
por_start: 1980
climo_start: 1991
climo_end: 2020
gage_area_min_share: 0.40
bfi_alpha: 0.925
trend_min_years: 20
rights_decade_bins: [1900, 1920, 1940, 1960, 1980, 2000, 2020, 2040]
```

---

## 9) Notes on Licensing & Attribution
- Respect dataset licenses; include access dates and version strings in figure captions or a consolidated **Data Sources** appendix in the TAP.  
- For modeled products (e.g., NWM), add “modeled” to legends and captions.

---

## 10) Summary
This spec keeps the exploratory layer rich and automated, the summary layer standardized and compact, and the public outputs focused on planning‑relevant context without straying into regulatory use accounting.
