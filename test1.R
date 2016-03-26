library(RAMpath)
posiA<-ramLCM(data,1:4)
posiC<-ramLCM(data,7:10)

posiA$fit
  
posiC=NULL
posiA<-ramLCM(data,2:7)
posiC<-ramLCM(data,8:13)
head(data)


cat(posiC$model$no)

cat(posiA$model$quadratic)

cat(posiC$model$latent)

cat(posiA$model)
summary(posiC$lavaan$quadratic)


cat(posiC$model$linear)
cat(posiC$model$quadratic)

model<-'
level =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 
 slope =~  0 * Y1 + 1 * Y2 + 2 * Y3 + 3 * Y4 + 4 * Y5 + 5 * Y6 
 Y1 ~~(vare)* Y1 
 Y2 ~~(vare)* Y2 
 Y3 ~~(vare)* Y3 
 Y4 ~~(vare)* Y4 
 Y5 ~~(vare)* Y5 
 Y6 ~~(vare)* Y6
slope~~0.001*slope
'

model2<-'
level =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 
slope =~  0 * Y1 + 1 * Y2 + 2 * Y3 + 3 * Y4 + 4 * Y5 + 5 * Y6 
quadratic =~  0 * Y1 + 1 * Y2 + 4 * Y3 + 9 * Y4 + 16 * Y5 + 25 * Y6 
Y1 ~~(vare)* Y1 
Y2 ~~(vare)* Y2 
Y3 ~~(vare)* Y3 
Y4 ~~(vare)* Y4 
Y5 ~~(vare)* Y5 
Y6 ~~(vare)* Y6 
level ~~ 0.001*slope
slope ~~ 0.001*quadratic
slope ~~ 0.001*slope
quadratic ~~ 0.001*quadratic
level ~~ 0.001*quadratic
'

parallel<-'
 level.X =~ 1* X1 +1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
 slope.X =~  -2.5 * X1 + -1 * X2 + -0.5 * X3 + 0.5 * X4 + 1 * X5 + 2.5 * X6 
 quadratic.X =~  -6.25 * X1 + -2.25 * X2 + -0.25 * X3 + 0.25 * X4 + 2.25 * X5 + 6.25 * X6 
quadratic.X~~0*quadratic.X
level.Y =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 
slope.Y =~  0 * Y1 + 14.115 * Y2 + 17.423 * Y3 + 14.038 * Y4 + 5.962 * Y5 + 5.000 * Y6 
slope.Y~~0*slope.Y
'
no<-lavaan::growth(posiC$model$no,data)
#slope fixed 0.001
lin<-lavaan::growth(model,data)
quad<-lavaan::growth(model2,data)
lat<-lavaan::growth(model3,data)
summary(lat)

paral<-lavaan::growth(parallel,data, start="mplus")


summary(posiA$lavaan$quadratic)

summary(paral, standardized=T)
parameterEstimates(paral) 
library(semTools)
compareFit(no, lin, quad, lat)


model<-'
#growth part
levelC =~  1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 
levelA =~  1* X2 +1* X3 +1* X4 +1* X5 +1* X6 

#latent cor
levelA ~~ levelC

# autoregressive part
Y2 ~ Y1 
Y3 ~ Y2 
Y4 ~ Y3 
Y5 ~ Y4 
Y6 ~ Y5 


X2 ~ X1 
X3 ~ X2 
X4 ~ X3 
X5 ~ X4 
X6 ~ X5 

# cross regression part
Y2 ~ (b)*X1 
Y3 ~ (b)*X2 
Y4 ~ (b)*3 
Y5 ~ (b)*X4 
Y6 ~ (b)*X5 

X2 ~ (a)*Y1 
X3 ~ (a)*Y2 
X4 ~ (a)*Y3 
X5 ~ (a)*Y4 
X6 ~ (a)*Y5 

# residual cor
X1 ~~ Y1 
X2 ~~ Y2 
X3 ~~ Y3 
X4 ~~ Y4 
X5 ~~ Y5 
X6 ~~ Y6 

#initial
levelA ~~ X1
levelC ~~ Y1
'


fit <- sem(model, data=data,estimator="MLR")

summary(fit,fit.measures=T, standardized=T)
noslope<-blavaan(model,data=data)

library(semPlot)
semPaths(model)

plot(bridge,"posiLCS")
library(DiagrammeR)
a<-"posiLCS.dot"
grViz(a)
