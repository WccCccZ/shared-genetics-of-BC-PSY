args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 5) {
  stop("Usage: Rscript run_lcv.R <lcv_dir> <trait1.sumstats.gz> <trait2.sumstats.gz> <ldscores.txt> <out.txt>")
}

lcv_dir   <- args[1]
trait1File <- args[2]
trait2File <- args[3]
ldscoresFile <- args[4]
outfile <- args[5]

if (!file.exists(trait1File)) stop("trait1 file not found")
if (!file.exists(trait2File)) stop("trait2 file not found")
if (!file.exists(ldscoresFile)) stop("ldscores file not found")

setwd(lcv_dir)
source(file.path(lcv_dir, "RunLCV.R"))

# 读取两个性状（建议用 ldsc munged 后的 sumstats）
d1 <- na.omit(read.table(gzfile(trait1File), header = TRUE, sep = "\t", stringsAsFactors = FALSE))
d2 <- na.omit(read.table(gzfile(trait2File), header = TRUE, sep = "\t", stringsAsFactors = FALSE))
d3 <- read.table(ldscoresFile, header = TRUE, stringsAsFactors = FALSE)

# 合并
m <- merge(d3, d1, by = "SNP")
dat <- merge(m, d2, by = "SNP")

# 排序（官方要求）
dat <- dat[order(dat$CHR, dat$BP), ]

# 若两个文件 A1 不同，翻转第二个性状的 Z 分数
if ("A1.x" %in% colnames(dat) && "A1.y" %in% colnames(dat)) {
  mismatch <- which(dat$A1.x != dat$A1.y)
  if (length(mismatch) > 0) {
    dat$Z.y[mismatch] <- -1 * dat$Z.y[mismatch]
    dat$A1.y[mismatch] <- dat$A1.x[mismatch]
    if ("A2.x" %in% colnames(dat) && "A2.y" %in% colnames(dat)) {
      dat$A2.y[mismatch] <- dat$A2.x[mismatch]
    }
  }
}

# 运行 LCV
res <- RunLCV(dat$L2, dat$Z.x, dat$Z.y)

# 输出最核心结果
out <- data.frame(
  gcp_est = res$gcp.pm,
  gcp_se = res$gcp.pse,
  p_gcp = res$pval.gcpzero.2tailed,
  rho_est = res$rho.est,
  rho_se = res$rho.err
)

write.table(out, file = outfile, sep = "\t", quote = FALSE, row.names = FALSE)