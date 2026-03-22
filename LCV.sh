#!/bin/bash
set -e

Rscript run_lcv.R \
/path/to/LCV \
/path/to/trait1.sumstats.gz \
/path/to/trait2.sumstats.gz \
/path/to/unannotated_LDscores.l2.ldsc \
/path/to/output/lcv_result.txt