#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

Rscript "${SCRIPT_DIR}/run_placo.R" \
/path/to/merged_sumstats.txt \
/path/to/placo_result.txt \
independent
