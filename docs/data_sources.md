# Data Sources

The analysis uses publicly available GWAS summary statistics for breast cancer and psychiatric disorders. The manuscript Supplementary Table 1 provides the definitive dataset provenance table, including:

- trait name and abbreviation;
- study or consortium name;
- PubMed ID or accession identifier;
- direct download link when available;
- sample size and case/control counts;
- ancestry;
- reference genome;
- publication year;
- dataset version, freeze, or access date.

Raw GWAS summary statistics are not redistributed in this repository when the original source requires users to download the files directly from the data provider. Users should place downloaded files under:

```text
data/raw/
```

After harmonization and LDSC munging, processed files should be placed under:

```text
data/harmonized/
```

Reference resources, such as HapMap3 SNPs, 1000 Genomes EUR LD reference files, LAVA reference data, MAGMA gene location files, and QTL summary resources, should be placed under:

```text
data/reference/
```

