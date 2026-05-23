#!/bin/bash
set -e

# 1.Pathway
LDSC_DIR=/path/to/ldsc
SUMSTATS_RAW=/path/to/trait1.txt
OUTDIR=/path/to/output
HM3_SNPLIST=/path/to/w_hm3.snplist
REF_LD_CHR=/path/to/eur_w_ld_chr/
W_LD_CHR=/path/to/eur_w_ld_chr/

mkdir -p ${OUTDIR}
cd ${LDSC_DIR}

# 2.summary statistics
python munge_sumstats.py \
  --sumstats ${SUMSTATS_RAW} \
  --N 100000 \
  --out ${OUTDIR}/trait1 \
  --merge-alleles ${HM3_SNPLIST}

# 3.h2_LDSC
python ldsc.py \
  --h2 ${OUTDIR}/trait1.sumstats.gz \
  --ref-ld-chr ${REF_LD_CHR} \
  --w-ld-chr ${W_LD_CHR} \
  --out ${OUTDIR}/trait1_h2