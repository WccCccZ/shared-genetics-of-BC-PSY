# Input and Output File Descriptions

This file summarizes the required inputs and expected outputs for each analysis module.

## Harmonized GWAS Inputs

Expected location:

```text
data/harmonized/<trait>.sumstats.gz
```

Recommended columns include:

| Column | Description |
|---|---|
| SNP | rsID |
| CHR | chromosome |
| BP | base-pair position |
| A1 | effect allele |
| A2 | non-effect allele |
| Z | Z statistic |
| P | P value |
| N | sample size |

## LDSC

Scripts:

```text
scripts/run_ldsc_h2.sh
scripts/run_ldsc_rg.sh
```

Inputs:

- raw or harmonized GWAS summary statistics;
- HapMap3 SNP list;
- European LD score reference directory.

Outputs:

```text
results/ldsc/*.sumstats.gz
results/ldsc/*_h2.log
results/ldsc/*_rg.log
```

## MiXeR

Script:

```text
scripts/MiXeR.sh
```

Inputs:

- two GWAS summary statistic files;
- 1000 Genomes EUR BIM and LD reference files;
- pruned SNP extraction list;
- Singularity image or equivalent MiXeR installation.

Outputs:

```text
results/mixer/*.fit.json
results/mixer/*.fit
```

## LAVA

Script:

```text
scripts/LAVA.sh
```

Inputs:

- LAVA EUR reference files;
- LAVA LD block file;
- `input.info.txt`;
- `sample.overlap.txt`;
- trait pair labels.

Outputs:

```text
results/lava/
```

## LCV

Scripts:

```text
scripts/LCV.sh
scripts/runlcv.R
```

Inputs:

- LCV source directory containing `RunLCV.R`;
- two LDSC-munged GWAS files;
- unannotated LD score file.

Outputs:

```text
results/lcv_lhcmr/*lcv_result.txt
```

Output columns:

| Column | Description |
|---|---|
| gcp_est | genetic causality proportion estimate |
| gcp_se | standard error of GCP |
| p_gcp | two-sided P value for nonzero GCP |
| rho_est | genetic correlation estimate |
| rho_se | standard error of genetic correlation |

## LHC-MR

Scripts:

```text
scripts/run_lhcmr.sh
scripts/run_lhcmr.R
```

Inputs:

- two GWAS summary statistic files;
- LD score file;
- local LD correlation file;
- European LD reference directory;
- HapMap3 SNP list;
- trait names.

Outputs:

```text
results/lcv_lhcmr/*lhcMR_result.csv
```

## PLACO

Scripts:

```text
scripts/PLACO.sh
scripts/run_placo.R
```

Input table columns:

| Column | Description |
|---|---|
| SNP | rsID |
| Z1 | Z statistic for trait 1 |
| P1 | P value for trait 1 |
| Z2 | Z statistic for trait 2 |
| P2 | P value for trait 2 |

Outputs:

```text
results/placo/*placo_result.txt
```

Output columns include the input columns plus `T_PLACO` and `P_PLACO`.

## FUMA and Colocalization

Inputs:

- PLACO-significant variants;
- locus-level annotation parameters described in the STAR Methods;
- GWAS summary statistics for colocalization.

Outputs:

```text
results/fuma_coloc/
```

These files support Table 1 and related supplementary tables.

## MAGMA and Pathway Analyses

Script:

```text
scripts/MAGMA.sh
```

Inputs:

- GWAS P-value file;
- PLINK reference panel;
- gene location file;
- gene-set annotation file.

Outputs:

```text
results/magma/
results/pathway/
```

## SMR

Script:

```text
scripts/SMR.sh
```

Inputs:

- GWAS summary statistics in SMR format;
- pQTL/eQTL summary resource;
- PLINK reference panel.

Outputs:

```text
results/smr/
```

