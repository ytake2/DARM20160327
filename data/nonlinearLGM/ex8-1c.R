#title:  Newsom Longitudinal SEM Chapter 8, Example 8.1c

library(lavaan)
setwd("<your directory path")
health1 <- read.table ("health.dat", header=FALSE)

names(health1) = c("age", "srh1", "srh2", "srh3", "srh4", "srh5", "srh6", "bmi1",
"bmi2", "bmi3", "bmi4", "bmi5", "bmi6", "cesdna1", "cesdpa1", "cesdso1",
"cesdna2", "cesdpa2", "cesdso2", "cesdna3", "cesdpa3", "cesdso3",
"cesdna4", "cesdpa4", "cesdso4", "cesdna5", "cesdpa5", "cesdso5",
"cesdna6", "cesdpa6", "cesdso6", "diab1", "diab2", "diab3 ", "diab4", "diab5", "diab6")

#+++++++++++++++++++++++++++++++
# Chapter 8, Example 8.1c
#+++++++++++++++++++++++++++++++

model8.1c <-   ' #increment(decrement) model;

		i =~ 1*bmi1 + 1*bmi2 + 1*bmi3 + 1*bmi4 + 1*bmi5 + 1*bmi6
		s1 =~ 0*bmi1 + 1*bmi2 + 2*bmi3 + 3*bmi4 + 4*bmi5 + 5*bmi6
		s2 =~ 0*bmi1 + 0*bmi2 + 0*bmi3 + 0*bmi4 + 1*bmi5 + 2*bmi6

i ~~ i
s1 ~~ s1
s2 ~~ s2
i ~~ s1 + s2
s1 ~~ s2
i ~ 1
s1 ~ 1
s2 ~ 1

bmi1 ~ 0
bmi2 ~ 0
bmi3 ~ 0
bmi4 ~ 0
bmi5 ~ 0
bmi6 ~ 0 '

fitmodel8.1c <- growth(model8.1c, data=health1)

summary(fitmodel8.1c, fit.measures=TRUE, standardized=TRUE, rsquare=TRUE)


summary(fitmodel8.1a, fit.measures=TRUE, standardized=TRUE, rsquare=TRUE)
anova(fitmodel8.1a2, fitmodel8.1a)



q<-ggplot(long.d1, aes(x=time,y=value, group=id))+geom_line()
q<-ggplot(long.d1, aes(x=time<3,y=value, group=id))+geom_line()+geom_abline(intercept=mean(newdata[,1]), slope=mean(newdata[,2]))

newdata<-as.data.frame(lavPredict(fitmodel8.1b, type = "ov"))
newdata$id<-1:length(newdata[,1])
head(newdata)

newdata.l<-gather(newdata,time,value,bmi1:bmi6)
newdata.l$time<-as.factor(newdata.l$time)
newdata.l$time<-as.numeric(newdata.l$time)-1

library(plyr)
mean.pred<-apply(newdata,2, mean)
sd.pred<-apply(newdata,2, sd)
low<-mean.pred-1.96*sd.pred
up<-mean.pred+1.96*sd.pred


pred<-data.frame(estimated.mean=mean.pred,sd=sd.pred,lowerCI=low,upperCI=up)[-7,]
pred$time<-0:5
ggplot(pred,aes(x=time,y=estimated.mean,group=1))+ 
  geom_point(size=3)+
  geom_line()+
  ylim(27, 28)
#geom_errorbar(aes(ymin=lowerCI,ymax=upperCI,width=.1))



aaa<-data.frame(time = seq(from = min(newdata.l$time), to = max(newdata.l$time), by = 0.01))
aaa$aaa<-predict(fitmodel8.1a, newdata=newdata)
head

summary(fitmodel8.1c)
plot(pred$time,pred$estimated.mean, ylim=c(27, 28), 
     ylab="estimated.mean", xlab="time",bty="l", type="l", col="red")
par(new=T)
plot(pred$time,pred$estimated.mean, ylim=c(27, 28), 
     ylab="estimated.mean", xlab="time",bty="l")

curve(27.180 + 0.168*x, add=T, from=0, to=3, col="red")
curve((27.75881-0.054*3)+ 0.054*x, add=T, from=3, to=5,col="blue")
abline(v=3, lty=3)
 
pred$estimated.mean[5]-pred$estimated.mean[4]

plot.new()
curve(plot(1, type="l", axes=F, xlab="", ylab="")
dev.off()
