plot.growth<-function(obj, type, ...){
  require(ggplot2)
  require(plyr)
  
  all<-obj
  
  preds<-as.list(paste0("pred",1:4))
  for(i in 1:4){
    preds[[i]]<-as.data.frame(lavPredict(all$lavaan[[i]], type = "ov")) 
  }
  
  params<-as.list(paste0("params",1:4))
  for(i in 1:4){
    params[[i]]<-parameterEstimates(all$lavaan[[i]])
  }

  Ms<-as.list(paste0("params",1:4))
  for(i in 1:4){
  Ms[[i]]<-sapply(preds[[i]],each(mean,sd))
  Ms[[i]]<-rbind(Ms[[i]],time=0:5)
  Ms[[i]]<-as.data.frame(t(Ms[[i]]))
  }
  
  if(type=="no"){
    intercept.no<-params[[1]][params[[1]]$lhs=="level"&params[[1]]$op=="~1",]$est
    no.f <- function(x) {intercept.no+0*x}
    g<-ggplot(Ms[[1]],aes(x=time,y=mean,group=1))
    g2<-g+geom_point(size=3)+ylab("estimated.mean")
    g3<-g2+stat_function(fun =no.f)
    } else if(type=="lin") {
      intercept.lin<-params[[2]][params[[2]]$lhs=="level"&params[[2]]$op=="~1",]$est
      slope.lin<-params[[2]][params[[2]]$lhs=="slope"&params[[2]]$op=="~1",]$est
      lin.f <- function(x) {x*slope.lin + intercept.lin} 
      g<-ggplot(Ms[[2]],aes(x=time,y=mean,group=1))
      g2<-g+geom_point(size=3)+ylab("estimated.mean")
      g3<-g2+stat_function(fun =lin.f)
    } else if(type=="quad"){
      intercept.quad<-params[[4]][params[[4]]$lhs=="level"&params[[4]]$op=="~1",]$est
      slope1.quad<-params[[4]][params[[4]]$lhs=="slope"&params[[4]]$op=="~1",]$est
      slope2.quad<-params[[4]][params[[4]]$lhs=="quadratic"&params[[4]]$op=="~1",]$est
      quad.f <- function(x) {(x^2)*slope2.quad+x*slope1.quad + intercept.quad}
      g<-ggplot(Ms[[4]],aes(x=time,y=mean,group=1))
      g2<-g+geom_point(size=3,...)+ylab("estimated.mean")
      g3<-g2+stat_function(fun =quad.f)
    } else g<-ggplot(Ms[[3]],aes(x=time,y=mean,group=1))
           g2<-g+geom_point(size=3,...)+ylab("estimated.mean")
           g3<-g2+geom_line()
    return(g3)
}





 