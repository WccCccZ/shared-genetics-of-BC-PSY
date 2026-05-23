# Workflow Overview

The study combines complementary genome-wide and locus-level analyses to evaluate shared genetic architecture between breast cancer and psychiatric disorders.

```mermaid
flowchart TD
    A["Public GWAS summary statistics"] --> B["GWAS QC and harmonization"]
    B --> C["LDSC: SNP heritability and genetic correlation"]
    B --> D["MiXeR: genetic overlap and polygenicity"]
    B --> E["LAVA: local genetic correlation"]
    B --> F["LCV and LHC-MR: model-dependent directional evidence"]
    B --> G["PLACO: pleiotropic SNP detection"]
    G --> H["FUMA annotation"]
    H --> I["Colocalization"]
    I --> J["High-confidence pleiotropic loci"]
    B --> K["MAGMA, E-MAGMA, H-MAGMA, TWAS"]
    K --> L["Prioritized genes and pathways"]
    B --> M["SMR protein-level prioritization"]
    C --> N["Main figures and tables"]
    D --> N
    E --> N
    F --> N
    J --> N
    L --> N
    M --> N
```

Interpretation notes:

- Genetic correlation and overlap analyses quantify shared genetic architecture but do not establish direct causality.
- LCV and LHC-MR provide model-dependent directional evidence.
- PLACO and colocalization prioritize pleiotropic loci.
- Pathway and tissue enrichment results reflect statistical overrepresentation, not direct pathway activation.
- SMR outputs are interpreted as genetically prioritized protein-level signals requiring validation.

