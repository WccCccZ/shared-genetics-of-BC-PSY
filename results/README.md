# Results Directory

Generated outputs should be organized as follows:

```text
results/ldsc/             LDSC heritability and genetic correlation results
results/mixer/            MiXeR univariate and bivariate fit results
results/lava/             LAVA local genetic correlation results
results/lcv_lhcmr/        LCV and LHC-MR outputs
results/placo/            PLACO pleiotropy outputs
results/fuma_coloc/       FUMA annotation and colocalization results
results/magma/            MAGMA gene-level outputs
results/pathway/          pathway and gene-set enrichment outputs
results/smr/              SMR protein-level prioritization outputs
results/figures_tables/   processed files used directly for manuscript figures and tables
```

Large generated files are ignored by `.gitignore` and should be regenerated locally from the scripts and public source data.

