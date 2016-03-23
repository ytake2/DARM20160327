library(simsem)

bmi<-model.lavaan(fitmodel8.1a)
t.dat <- generate(test, 500)

t.dat$id<-1:nrow(t.dat)
t.dat<-t.dat[,c(7,1,2,3,4,5,6)]

write.csv(t.dat, "data/bmi.csv")

fit<-growth(model8.1a,t.dat)

library(DT)
datatable(round(parameterEstimates(fit)[25:27,],digits=3))

library(psytabs)


compareModels(fitmodel8.1a, fitmodel8.1b)
library(semTools)

aaa<-compareFit(fitmodel8.1a, fitmodel8.1b)@fit[,c("chisq","df","pvalue","cfi","srmr",
                                                   "rmsea","aic","bic")]
aaa<-round(aaa, digits=3)
datatable(aaa)


fitMeasures(fitmodel8.1b)
