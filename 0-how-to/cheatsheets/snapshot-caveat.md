# Snapshot Caveat - v0.1
**Banner:** Code Implementation and Deployment - Not Production Data. Not for enforcement.

## Purpose
Screening-level literacy aid; clarifies scope, limits, and provenance for TAPs pilot work.

## Data sources (fill before release)
- OWRD public systems: WRIS/SWARS/GWIS; manual export dates: <YYYY-MM-DD>
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

