#!/bin/bash
set -e

Rscript run_lhcmr.R \
/path/to/trait1_sumstats.txt.gz \
/path/to/trait2_sumstats.txt.gz \
/path/to/ldscores_filtered.csv \
/path/to/local_ld_rho.csv \
/path/to/eur_w_ld_chr/ \
/path/to/w_hm3.snplist \
trait1 \
trait2