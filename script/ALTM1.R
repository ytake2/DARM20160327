'
#intercept and slope part
levelX =~  0* X1 + 1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
slopeX =~  0* X1 + 1* X2 + 2* X3 +3* X4 +4* X5 +5* X6 

levelY =~  0* Y1 + 1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 
slopeY =~  0* Y1 + 1* Y2 + 2* Y3 +3* Y4 +4* Y5 +5* Y6 


# covariance between latent factors and first period
levelX ~~ levelY + slopeX + slopeY + X1 + Y1
levelY ~~ slopeX + slopeY  + X1 + Y1
slopeX ~~ slopeY  + X1 + Y1
slopeY ~~ X1 + Y1
X1 ~~ Y1

# autoregressive part
X2 ~ X1 ;X3 ~ X2; X4 ~ X3; X5 ~ X4; X6 ~ X5 
Y2 ~ Y1 ;Y3 ~ Y2; Y4 ~ Y3; Y5 ~ Y4; Y6 ~ Y5 

# cross-lag part
Y2 ~ X1; Y3 ~ X2; Y4 ~ X3; Y5 ~ X4; Y6 ~ X5 
X2 ~ Y1; X3 ~ Y2; X4 ~ Y3; X5 ~ Y4; X6 ~ Y5 

# residuals 
X1 ~ 1; X2 ~ 1; X3 ~ 1; X4 ~ 1; X5 ~ 1; X6 ~ 1; 
Y1 ~ 1; Y2 ~ 1; Y3 ~ 1; Y4 ~ 1; Y5 ~ 1; Y6 ~ 1; 
'