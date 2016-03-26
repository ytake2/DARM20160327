'
#intercept and slope part
levelX =~   1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
levelX~1; levelX~~levelX
slopeX =~   1* X2 + 2* X3 +3* X4 +4* X5 +5* X6 
slopeX~1; slopeX~~slopeX


#
X1 ~~ X1;
X2 ~~ X2;
X3 ~~ X3;
X4 ~~ X4;
X5 ~~ X5;
X6 ~~ X6;

# covariance between latent factors and first period
levelX ~~ slopeX
levelX ~~ X1
slopeX ~~ X1

# autoregressive part
X2 ~ X1 ;X3 ~ X2; X4 ~ X3; X5 ~ X4; X6 ~ X5 
X1
'

ALTM1<-source('script/uniALTM.R')$value
ALTMfit<-lavaan(ALTM1, data=data)
summary(ALTMfit, fit.measures=T, standardized=T)


