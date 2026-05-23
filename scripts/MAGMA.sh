#!/bin/bash
set -e

MAGMA=/path/to/magma
REF_PREFIX=/path/to/reference/g1000_eur
GENE_LOC=/path/to/NCBI37.3.gene.loc
SET_FILE=/path/to/gene_set_file.gmt
PVAL_FILE=/path/to/gwas_sumstats.txt
OUTDIR=/path/to/output

mkdir -p ${OUTDIR}

# Step 1: SNP-to-gene annotation
${MAGMA} \
  --annotate \
  --snp-loc ${REF_PREFIX}.bim \
  --gene-loc ${GENE_LOC} \
  --out ${OUTDIR}/trait

# Step 2: Gene analysis
${MAGMA} \
  --bfile ${REF_PREFIX} \
  --pval ${PVAL_FILE} N=100000 \
  --gene-annot ${OUTDIR}/trait.genes.annot \
  --genes-only \
  --out ${OUTDIR}/trait_gene

# Step 3: Gene-set analysis
${MAGMA} \
  --gene-results ${OUTDIR}/trait_gene.genes.raw \
  --set-annot ${SET_FILE} \
  --out ${OUTDIR}/trait_gsa
