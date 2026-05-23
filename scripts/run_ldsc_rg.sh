#!/bin/bash
set -e

# 1.Pathway
LDSC_DIR=/path/to/ldsc
SUMSTATS1_RAW=/path/to/trait1.txt
SUMSTATS2_RAW=/path/to/trait2.txt
OUTDIR=/path/to/output
HM3_SNPLIST=/path/to/w_hm3.snplist
REF_LD_CHR=/path/to/eur_w_ld_chr/
W_LD_CHR=/path/to/eur_w_ld_chr/

mkdir -p ${OUTDIR}
cd ${LDSC_DIR}

# 2. Trait1
python munge_sumstats.py \
  --sumstats ${SUMSTATS1_RAW} \
  --N 100000 \
  --out ${OUTDIR}/trait1 \
  --merge-alleles ${HM3_SNPLIST}

# 3. Trait2
python munge_sumstats.py \
  --sumstats ${SUMSTATS2_RAW} \
  --N 120000 \
  --out ${OUTDIR}/trait2 \
  --merge-alleles ${HM3_SNPLIST}

# 4. rg_LDSC
python ldsc.py \
  --rg ${OUTDIR}/trait1.sumstats.gz,${OUTDIR}/trait2.sumstats.gz \
  --ref-ld-chr ${REF_LD_CHR} \
  --w-ld-chr ${W_LD_CHR} \
  --out ${OUTDIR}/trait1_trait2_rg