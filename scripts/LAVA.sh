#!/bin/bash
set -e

Rscript /path/to/LAVA/lava_rg.R \
/path/to/LAVA/ref_data/ref-genome/g1000_eur \
/path/to/LAVA/ref_data/ld-block/LAVA_blocks.txt \
/path/to/project/lava_result/input.info.txt \
/path/to/project/lava_result/sample.overlap.txt \
"trait1;trait2" \
"trait1-trait2"