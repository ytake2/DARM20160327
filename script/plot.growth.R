data<-read.csv("data/Garland.csv",header=T)
X.fits<-ramLCM(data, 2:7, model="all")
Y.fits<-ramLCM(data, 8:13, model="no")
cat(Y.fits$model$linear)
cat(Y.fits$model$linear)

lv<-lavaan::growth(, data=data, std.lv=T)

plot.growth<-function(obj, type, ...){
  all<-obj
  no<-parameterEstimates(all$lavaan$no)
  lin<-parameterEstimates(all$lavaan$linear)
  lat<-parameterEstimates(all$lavaan$latent)
  quad<-parameterEstimates(all$lavaan$quadratic)
  
  newdata.no<-as.data.frame(lavPredict(all$lavaan$no, type = "ov"))
  newdata.no$id<-1:length(newdata.no[,1])
  mean.pred.no<-sapply(newdata.no, mean)
  sd.pred.no<-sapply(newdata.no, sd)
  pred.no<-data.frame(mean=mean.pred.no,sd=sd.pred.no)
  pred.no<-pred.no[-nrow(pred.no),]
  pred.no$time<-0:(nrow(pred.no)-1)
  
  newdata.lin<-as.data.frame(lavPredict(all$lavaan$linear, type = "ov"))
  newdata.lin$id<-1:length(newdata.lin[,1])
  mean.pred.lin<-sapply(newdata.lin, mean)
  sd.pred.lin<-sapply(newdata.lin, sd)
  pred.lin<-data.frame(mean=mean.pred.lin,sd=sd.pred.lin)
  pred.lin<-pred.lin[-nrow(pred.lin),]
  pred.lin$time<-0:(nrow(pred.lin)-1)
  
  newdata.quad<-as.data.frame(lavPredict(all$lavaan$quadratic, type = "ov"))
  newdata.quad$id<-1:length(newdata.quad[,1])
  mean.pred.quad<-sapply(newdata.quad, mean)
  sd.pred.quad<-sapply(newdata.quad, sd)
  pred.quad<-data.frame(mean=mean.pred.quad,sd=sd.pred.quad)
  pred.quad<-pred.quad[-nrow(pred.quad),]
  pred.quad$time<-0:(nrow(pred.quad)-1)
  
  
  newdata.lat<-as.data.frame(lavPredict(all$lavaan$latent, type = "ov"))
  newdata.lat$id<-1:length(newdata.lat[,1])
  mean.pred.lat<-sapply(newdata.lat, mean)
  sd.pred.lat<-sapply(newdata.lat, sd)
  pred.lat<-data.frame(mean=mean.pred.lat,sd=sd.pred.lat)
  pred.lat<-pred.lat[-nrow(pred.lat),]
  pred.lat$time<-0:(nrow(pred.lat)-1)
  
  
  
  if(type=="no"){
    intercept.no<-no[no$lhs=="level"&no$op=="~1",]$est
    no.f <- function(x) {intercept.no+0*x}
    g<-ggplot(pred.no,aes(x=time,y=mean,group=1))
    g2<-g+geom_point(size=3)+ylab("estimated.mean")
    g3<-g2+stat_function(fun =no.f)
    } else if(type=="lin") {
      intercept.lin<-lin[lin$lhs=="level"&lin$op=="~1",]$est
      slope.lin<-lin[lin$lhs=="slope"&lin$op=="~1",]$est
      lin.f <- function(x) {x*slope.lin + intercept.lin} 
      g<-ggplot(pred.lin,aes(x=time,y=mean,group=1))
      g2<-g+geom_point(size=3)+ylab("estimated.mean")
      g3<-g2+stat_function(fun =lin.f)
    } else if(type=="quad"){
      intercept.quad<-quad[quad$lhs=="level"&quad$op=="~1",]$est
      slope1.quad<-quad[quad$lhs=="slope"&quad$op=="~1",]$est
      slope2.quad<-quad[quad$lhs=="quadratic"&quad$op=="~1",]$est
      quad.f <- function(x) {(x^2)*slope2.quad+x*slope1.quad + intercept.quad}
      g<-ggplot(pred.quad,aes(x=time,y=mean,group=1))
      g2<-g+geom_point(size=3,...)+ylab("estimated.mean")
      g3<-g2+stat_function(fun =quad.f,...)
    } else g<-ggplot(pred.lat,aes(x=time,y=mean,group=1))
           g2<-g+geom_point(size=3,...)+ylab("estimated.mean")
           g3<-g2+geom_line()
  return(as.list(g3))
}


a<-plot.growth(X.fits,type="no")+ylim(3.2,3.5)
b<-plot.growth(X.fits,type="lin")+ylim(3.2,3.5)
c<-plot.growth(X.fits,type="quad")+ylim(3.2,3.5)
d<-plot.growth(X.fits,type="latent")+ylim(3.2,3.5)


a<-plot.growth(Y.fits,type="no")+ylim(3.2,3.5)
b<-plot.growth(Y.fits,type="lin")+ylim(3.2,3.5)
c<-plot.growth(Y.fits,type="quad")+ylim(3.2,3.5)
d<-plot.growth(Y.fits,type="latent")+ylim(3.2,3.5)

library(grid)
pushViewport(viewport(layout=grid.layout(2, 2))) #画面を区切る（今回は2行2列の4分割）
print(a, vp=viewport(layout.pos.row=1, layout.pos.col=1)) #1行目の1・2列
print(b, vp=viewport(layout.pos.row=2, layout.pos.col=1)  ) #2行目の1列
print(c, vp=viewport(layout.pos.row=1, layout.pos.col=2)  ) #
print(d, vp=viewport(layout.pos.row=2, layout.pos.col=2)  ) #


all<-ramLCM(data, 2:7, model="all", ram.out=T)
library(DT)
datatable(round(X.fits$fit[c("chisq","df","pvalue", 
                          "cfi","srmr","rmsea", 
                          "aic","bic","bic2"),],
                        digits=2))

 