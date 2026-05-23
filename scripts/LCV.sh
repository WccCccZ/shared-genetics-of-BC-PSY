#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

Rscript "${SCRIPT_DIR}/runlcv.R" \
/path/to/LCV \
/path/to/trait1.sumstats.gz \
/path/to/trait2.sumstats.gz \
/path/to/unannotated_LDscores.l2.ldsc \
/path/to/output/lcv_result.txt
