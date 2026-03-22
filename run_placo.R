args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 3) {
  stop("Usage: Rscript run_placo.R <input.txt> <output.txt> <independent|correlated>")
}

infile <- args[1]
outfile <- args[2]
mode <- args[3]

if (!file.exists(infile)) stop("Input file not found: ", infile)

# 载入 PLACO 主程序
source("/path/to/PLACO_v0.2.0.R")

dat <- read.table(infile, header = TRUE, sep = "\t", check.names = FALSE, stringsAsFactors = FALSE)

need_cols <- c("SNP", "Z1", "P1", "Z2", "P2")
miss_cols <- setdiff(need_cols, colnames(dat))
if (length(miss_cols) > 0) {
  stop("Missing columns: ", paste(miss_cols, collapse = ", "))
}

dat <- dat[, need_cols]
dat <- dat[complete.cases(dat), ]

# 转数值，避免字符型报错
dat$Z1 <- as.numeric(dat$Z1)
dat$P1 <- as.numeric(dat$P1)
dat$Z2 <- as.numeric(dat$Z2)
dat$P2 <- as.numeric(dat$P2)

# 官方建议：去掉极端大效应变异，避免伪阳性
dat <- dat[(dat$Z1^2 <= 80) & (dat$Z2^2 <= 80), ]

Z.matrix <- as.matrix(dat[, c("Z1", "Z2")])
P.matrix <- as.matrix(dat[, c("P1", "P2")])

# 第一步：估计方差参数（只需要做一次）
VarZ <- var.placo(Z.matrix, P.matrix, p.threshold = 1e-4)

# 第二步：逐 SNP 跑 pleiotropy test
if (mode == "independent") {
  out <- t(sapply(seq_len(nrow(dat)), function(i) {
    x <- placo(Z = Z.matrix[i, ], VarZ = VarZ)
    c(T_PLACO = x$T.placo, P_PLACO = x$p.placo)
  }))
} else if (mode == "correlated") {
  CorZ <- cor.pearson(Z.matrix, P.matrix, p.threshold = 1e-4, returnMatrix = FALSE)
  out <- t(sapply(seq_len(nrow(dat)), function(i) {
    x <- placo.plus(Z = Z.matrix[i, ], VarZ = VarZ, CorZ = CorZ)
    c(T_PLACO = x$T.placo.plus, P_PLACO = x$p.placo.plus)
  }))
} else {
  stop("mode must be 'independent' or 'correlated'")
}

out <- as.data.frame(out)
res <- cbind(dat, out)

write.table(res, file = outfile, sep = "\t", quote = FALSE, row.names = FALSE)