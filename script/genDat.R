library(lavaan)
#correlation matrix obtained from Garland (2015).
#http://dx.doi.org/10.3389/fpsyg.2015.00015

Garland.mat<-'
1
0.65 1
0.58 0.65 1
0.54 0.57 0.71 1
0.61 0.61 0.70 0.77 1
0.61 0.60 0.62 0.56 0.66 1
0.70 0.36 0.33 0.27 0.38 0.41 1
0.37 0.74 0.45 0.45 0.38 0.40 0.35 1
0.31 0.37 0.74 0.49 0.42 0.44 0.28 0.42 1
0.30 0.34 0.45 0.77 0.50 0.31 0.33 0.44 0.47 1
0.45 0.49 0.41 0.56 0.79 0.50 0.42 0.44 0.31 0.52 1
0.32 0.30 0.30 0.26 0.34 0.72 0.44 0.41 0.43 0.30 0.41 1
'
Garland.mat2 <- as.matrix(getCov(Garland.mat))
#Garland.sd<-c(1.07, 1.08, 1.13, 1.18, 1.17, 1.07, 0.90, 0.92, 0.98, 1.01, 0.99, 1.02)

#fullmatrix
#full.cov <- lavaan:::cor2cov(R=Garland.cov, sds=Garland.sd,names=c(paste0("X",1:6),paste0("Y",1:6)))
m<-c(3.45,3.29,3.25,3.36,3.33,3.27,3.37,3.25,3.28,3.39,3.38,3.31)

#create dataset
library(MASS)
Garland<-as.data.frame(mvrnorm(n=2000,mu=m,Sigma=Garland.mat2,empirical=F))

colnames(Garland)<-c(paste0("X",1:6),paste0("Y",1:6))

write.csv(Garland,"data/Garland.csv")


Liu.mat<-'
1
0.53 1
0.54 0.71 1
0.58 0.75 0.8 1
0.59 0.76 0.83 0.87 1
0.58 0.76 0.84 0.88 0.88 1
-0.07 -0.02 0.01 0.03 -0.01 0 1
-0.01 0.02 0.06 0.09 0.07 0.06 0.66 1
-0.52 0.13 0.13 0.16 0.16 0.16 0.69 0.84 1
0.11 0.19 0.22 0.25 0.23 0.24 0.7 0.85 0.91 1
0.13 0.23 0.26 0.3 0.28 0.27 0.7 0.86 0.91 0.94 1
0.15 0.25 0.29 0.33 0.31 0.31 0.69 0.85 0.92 0.94 0.96 1
'
Liu.mat2 <- as.matrix(getCov(Liu.mat))
#Garland.sd<-c(1.07, 1.08, 1.13, 1.18, 1.17, 1.07, 0.90, 0.92, 0.98, 1.01, 0.99, 1.02)

#fullmatrix
#full.cov <- lavaan:::cor2cov(R=Garland.cov, sds=Garland.sd,names=c(paste0("X",1:6),paste0("Y",1:6)))
m<-c(0.8,1.14,1.38,1.66,1.81,1.97,0.35,0.89,1.56,2.18,2.75,3.27)

#create dataset
library(MASS)
Liu<-as.data.frame(mvrnorm(n=500,mu=m,Sigma=Liu.mat2,empirical=F))

colnames(Garland)<-c(paste0("X",1:6),paste0("Y",1:6))

write.csv(Garland,"data/Garland.csv")

