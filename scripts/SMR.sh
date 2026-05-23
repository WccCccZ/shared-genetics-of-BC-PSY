#!/bin/bash
set -e

SMR=/path/to/smr
REF_PREFIX=/path/to/reference/ref_data
GWAS=/path/to/gwas/gwas.ma
PQTL=/path/to/qtl/pqtl_data
OUTDIR=/path/to/output

mkdir -p ${OUTDIR}

${SMR} \
  --bfile ${REF_PREFIX} \
  --gwas-summary ${GWAS} \
  --beqtl-summary ${PQTL} \
  --out ${OUTDIR}/smr_result \
  --thread-num 16