args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 8) {
  stop("Usage: Rscript run_lhcmr.R <trait1_file> <trait2_file> <LD_file> <rho_file> <ld_dir> <hm3_file> <trait1_name> <trait2_name> [outdir]")
}

trait1_file <- args[1]
trait2_file <- args[2]
LD.filepath <- args[3]
rho.filepath <- args[4]
ld <- args[5]
hm3 <- args[6]
trait1_name <- args[7]
trait2_name <- args[8]
outdir <- ifelse(length(args) >= 9, args[9], ".")

dir.create(outdir, recursive = TRUE, showWarnings = FALSE)

suppressPackageStartupMessages({
  library(lhcMR)
  library(data.table)
})


X <- data.table::fread(cmd = paste("zcat <", trait1_file))
Y <- data.table::fread(cmd = paste("zcat <", trait2_file))

trait.names <- c(trait1_name, trait2_name)
input.files <- list(X, Y)


df <- merge_sumstats(
  input.files = input.files,
  trait.names = trait.names,
  LD.filepath = LD.filepath,
  rho.filepath = rho.filepath
)


SP_list <- calculate_SP(
  input.df = df,
  trait.names = trait.names,
  run_ldsc = TRUE,
  run_MR = TRUE,
  hm3 = hm3,
  ld = ld,
  nStep = 2,
  SP_single = 3,
  SP_pair = 50,
  SNP_filter = 10
)


res <- lhc_mr(
  SP_list = SP_list,
  trait.names = trait.names,
  paral_method = "lapply",
  nBlock = 200,
  nCores = 16
)

outfile <- file.path(outdir, paste0(trait1_name, "_", trait2_name, "_lhcMR_result.csv"))
write.csv(as.data.frame(res), file = outfile, row.names = FALSE)
