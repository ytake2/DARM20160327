

library(lavaan)
mat<-'
1
0.53 1
0.54 0.71 1
-0.58 0.75 0.80 1
0.59 0.76 -0.83 0.87 1
0.58 0.76 0.84 0.88 0.88 1
-0.07 -0.02 0.01 0.03 -0.01 0.00 1
-0.01 0.02 0.06 0.09 0.07 0.06 0.66 1
-0.52 0.13 0.16 0.18 0.16 0.16 0.69 0.84 1
0.11 0.19 0.22 0.25 0.23 0.24 0.70 0.85 0.91 1
0.13 0.23 0.26 0.30 0.28 0.27 0.70 0.86 0.91 0.94 1
0.15 0.25 0.29 0.33 0.31 0.31 0.69 0.85 0.92 0.94 0.96 1
'

wheaton.cov <- getCov(mat,names=c("x1","x2","x3","x4","x5","x6","y1","y2","y3","y4","y5","y6"))
sd<-c(0.71, 0.91, 1.17, 1.35, 1.55, 1.64, 0.65, 1.00, 1.35, 1.67, 2.00, 2.35)
#共分散行列に変換
full.cov <- lavaan:::cor2cov(wheaton.cov,sd,names=c("x1","x2","x3","x4","x5","x6","y1","y2","y3","y4","y5","y6"))

library(RAMpath)

fit <- lavaan:::sem(model, sample.cov=full.cov, sample.nobs=500)
rownames(full.cov)<-c(paste0("X",1:6),paste0("Y",1:6))
colnames(full.cov)<-c(paste0("X",1:6),paste0("Y",1:6))

test.blcs<-ramBLCS(ex3, 7:12, 1:6, ram.out=TRUE)
lavaan::sem(test.blcs$model, data=full.cov, sample.cov=500)
