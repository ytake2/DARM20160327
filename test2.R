?ramBLCS

data(ex3)

test.blcs<-ramBLCS(ex3, 7:12, 1:6, ram.out=TRUE)
summary(test.blcs$lavaan, fit=TRUE)

head(ex3)

ex3.l<-gather(ex3, time, value, X1:X6)[,7:8]
ex3.l$time<-as.factor(ex3.l$time)
ex3.l$time<-as.numeric(ex3.l$time)
ex3.l$id<-rep(1:500,6)
head(ex3.l.2)
ex3.l.2<-gather(ex3, time, value, Y7:Y12)[,7:8]
ex3.l.2$time<-as.factor(ex3.l.2$time)
ex3.l.2$time<-as.numeric(ex3.l.2$time)
ex3.l.2$id<-rep(1:500,6)

l<-rbind(ex3.l,ex3.l.2)
l$var<-rep(c("a","b"),each=3000)
ggplot(l, aes(x=time, y=value,group=id))+
  geom_line()+facet_wrap(~var)+
  stat_smooth(aes(group=NULL),col="red",method="lm",formula=y~poly(x,2))


X.LCM<-ramLCM(ex3,1:6,ram.out=T)
Y.LCM<-ramLCM(ex3,7:12,ram.out=T)

data(ex3)
## Example 3. Growth curve models
gcm.all<-ramLCM(ex3, 7:9, ram.out=TRUE)
growth(gcm.all$model$no,data=ex3)
growth(gcm.all$model$linear, data=ex3)
growth(gcm.all$model$quadratic, data=ex3)
growth(gcm.all$model$latent, data=ex3)

growth(Y.LCM$model$no,data=ex3)
growth(Y.LCM$model$linear, data=ex3)
growth(Y.LCM$model$quadratic, data=ex3)
growth(Y.LCM$model$latent, data=ex3)

gcm.pred<-ramLCM(ex3, c(1,2,4,6), model='linear', basis=c(1,2,4,6), 
                 predictor=c(3,5), ram.out=TRUE)

gcm.all<-ramLCM(ex3, c(1,2,4,6), basis=c(1,2,4,6), ram.out=TRUE)


