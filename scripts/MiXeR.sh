#!/bin/bash
set -e

# MiXeR
export MIXER_PY="singularity exec /path/to/mixer.sif python /tools/mixer/precimed/mixer.py"

# 2 TRAITS
TRAIT1="/path/to/sumstats/trait1.sumstats.gz"
TRAIT2="/path/to/sumstats/trait2.sumstats.gz"

# ref
BIM="/path/to/ref/1000G.EUR.QC.@.bim"
LD="/path/to/ref/1000G.EUR.QC.@.run4.ld"
EXTRACT="/path/to/ref/1000G.EUR.QC.pruned.snps"

# output
OUTDIR="/path/to/output"
mkdir -p ${OUTDIR}

# args
COMMON_ARGS="--bim-file ${BIM} --ld-file ${LD} --extract ${EXTRACT}"

# 1. uni
${MIXER_PY} fit1 ${COMMON_ARGS} \
  --trait1-file ${TRAIT1} \
  --out ${OUTDIR}/trait1.fit

${MIXER_PY} fit1 ${COMMON_ARGS} \
  --trait1-file ${TRAIT2} \
  --out ${OUTDIR}/trait2.fit

# 2. bi
for REP in $(seq 1 20)
do
  SEED=$((1000 + REP))

  ${MIXER_PY} fit2 ${COMMON_ARGS} \
    --seed ${SEED} \
    --trait1-file ${TRAIT1} \
    --trait2-file ${TRAIT2} \
    --trait1-params ${OUTDIR}/trait1.fit.json \
    --trait2-params ${OUTDIR}/trait2.fit.json \
    --out ${OUTDIR}/trait1_vs_trait2.rep${REP}.fit
done
