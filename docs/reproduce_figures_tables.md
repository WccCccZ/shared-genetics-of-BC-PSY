# Reproducing Key Figures and Tables

This document maps the main manuscript outputs to the relevant scripts and result directories.

| Manuscript output | Analysis source | Script or workflow | Expected output directory |
|---|---|---|---|
| Figure 1 | Workflow schematic | `docs/workflow_overview.md` and manuscript figure generation files | `results/figures_tables/` |
| Figure 2 | MiXeR and LAVA summary | `scripts/MiXeR.sh`; `scripts/LAVA.sh` | `results/mixer/`; `results/lava/` |
| Figure 3 | LDSC-SEG or tissue enrichment summary | STAR Methods tissue enrichment workflow | `results/figures_tables/` |
| Figure 4 | Pleiotropic loci and prioritized genes | `scripts/PLACO.sh`; FUMA and colocalization workflow | `results/placo/`; `results/fuma_coloc/` |
| Figure 5 | Pathway enrichment | `scripts/MAGMA.sh` and pathway analysis outputs | `results/pathway/` |
| Table 1 | Colocalized pleiotropic loci | PLACO, FUMA, and colocalization workflow | `results/fuma_coloc/` |
| Table 2 | Prioritized pleiotropic genes | MAGMA, E-MAGMA, H-MAGMA, TWAS, and supporting evidence synthesis | `results/magma/`; `results/pathway/`; `results/figures_tables/` |
| Supplementary Table 1 | Dataset provenance | Manuscript data-source curation | `docs/data_sources.md` |
| Supplementary Table 2 | LDSC heritability and genetic correlation | `scripts/run_ldsc_h2.sh`; `scripts/run_ldsc_rg.sh` | `results/ldsc/` |
| Supplementary Tables 3-5 | MiXeR and LAVA analyses | `scripts/MiXeR.sh`; `scripts/LAVA.sh` | `results/mixer/`; `results/lava/` |
| Supplementary Table 6 | LCV and LHC-MR | `scripts/LCV.sh`; `scripts/run_lhcmr.sh` | `results/lcv_lhcmr/` |
| Supplementary Tables 7-10 | PLACO, FUMA, and colocalization | `scripts/PLACO.sh`; FUMA and COLOC workflow | `results/placo/`; `results/fuma_coloc/` |
| Supplementary Tables 11-20 | MAGMA, gene mapping, TWAS, and pathway analyses | `scripts/MAGMA.sh` and related gene-level workflows | `results/magma/`; `results/pathway/` |
| Supplementary Table 21 | SMR protein-level prioritization | `scripts/SMR.sh` | `results/smr/` |

Notes:

- Final figure assembly may require manuscript-specific plotting scripts or manual layout files that combine outputs from multiple modules.
- When processed intermediate files cannot be redistributed, users should regenerate them from the public data sources listed in Supplementary Table 1.
- Keep the final CSV/TSV files used for each figure and table in `results/figures_tables/` to simplify audit and reproduction.

