## LCMのコード

```{r, results='asis'}
#適合度の抽出
fit0.m<-round(fitMeasures(model0.fit)
              [c("chisq","df","pvalue",
                 "cfi","srmr","rmsea")],digits=2)
fit0.m<-t(as.data.frame(fit0.m))
library(DT)
datatable(fit0.m,extensions = 'Buttons', options = list(
  dom = 'Bfrtip',
  buttons = c('copy', 'csv', 'excel', 'pdf', 'print')
))

```


## パラメータの推定値
```{r}
library(DT)
fit0.params<-as.data.frame(parameterEstimates(model0.fit))
fit0.params[,4:ncol(fit0.params)]<-round(fit0.params[,4:ncol(fit0.params)],digits=3)
fit0.is<-fit0.params[13:17,]
fit0.is<-fit0.is[c(4,5,1,2,3),]
fit0.is[,2]<-c("平均","　","分散","　", "因子間相関")
fit0.is<-fit0.is[,-3]
#fit0.is<-fit[]
datatable(fit0.is)
```


# Piecewise Model

##　コード全体

```{r}
model1 <-'

#切片因子の設定
i =~ 1*X1 + 1*X2 + 1*X3 + 
1*X4 + 1*X5 + 1*X6

#傾き因子の設定
s1 =~ 0*X1 + 1*X2 + 2*X3 +
3*X4 + 4*X5 + 5*X6

s2 =~ 0*X1 + 1*X2 + 4*X3 +
9*X4 + 16*X5 + 25*X6


#切片と傾きの分散
i ~~ i ; s1 ~~ s1 ; s2 ~~ s2; 

#因子間相関
i ~~ s1 + s2; s1 ~~ s2

#因子平均
i ~ 1 ; s1 ~ 1 ; s2 ~ 1

#誤差分散
X1 ~ 0; X2 ~ 0; X3 ~ 0
X4 ~ 0; X5 ~ 0; X6 ~ 0
'
```

## 切片因子の設定  
- 因子負荷を1に固定 

```
#lavaan code
i =~ 1*t1+1*t2+1*t3+1*t4+1*t5
```
```{r, echo=F}
source("diag.R")
library(DiagrammeR)
grViz(int)
```

## 前半の傾きの設定  
前半の傾き(s1)の因子負荷を  
区分時点以降同値に固定  

```
#lavaan model code
i=~0*t1+1*t2+2*t3+1*t3+1*t3
```
```{r, fig.align='right', echo=F}
grViz(s1)
```

## 後半の傾きの設定
後半の傾き(s1)の因子負荷を  
区分時点まで0に固定  
```
#lavaan model code
i=~0*t1+0*t2+0*t3+1*t4+2*t5
```
```{r, fig.align='right', echo=F}
grViz(s2)
```


## その他の設定
- 切片と傾きの分散を自由推定
- 因子間相関を自由推定
- 因子平均を自由推定
- 誤差分散を0に固定  

```
#切片と傾きの分散
i ~~ i ; s1 ~~ s1 ; s2 ~~ s2
#因子間相関
i ~~ s1 + s2 ; s1 ~~ s2
#因子平均
i ~ 1 ; s1 ~ 1 ; s2 ~ 1
#誤差分散
bmi1 ~ 0; bmi2 ~ 0; bmi3 ~ 0
bmi4 ~ 0; bmi5 ~ 0; bmi6 ~ 0
'
```


## 推定の実行  
- モデル

```
library(lavaan)
model1.fit<-lavaan::growth(model1, data)
```
```{r}
library(lavaan)
source("script/plot.growth.R")
model1.fit<-lavaan::growth(model1, data=data)

g<-plot.growth(model1.fit,type="quad")
g+ylim(3.2,3.5)+theme_bw()
curve(3.654+(-0.032*3)+ -0.032*x, add=T, from=3, to=5,col="blue")
abline(v=3, lty=3)

newdata.l<-gather(newdata,time,value, 1:(ncol(newdata)-1))
newdata.l$time<-as.factor(newdata.l$time)
newdata.l$time<-as.numeric(newdata.l$time)-1




newdata<-as.data.frame(lavPredict(model1.fit, type = "ov"))
newdata$id<-1:length(newdata[,1])

library(tidyr)
newdata.l<-gather(newdata,time,value,X1:X6)
newdata.l$time<-as.factor(newdata.l$time)
newdata.l$time<-as.numeric(newdata.l$time)-1

library(plyr)
mean.pred<-apply(newdata,2, mean)
sd.pred<-apply(newdata,2, sd)
low<-mean.pred-1.96*sd.pred
up<-mean.pred+1.96*sd.pred


pred<-data.frame(mean=mean.pred,sd=sd.pred,lowerCI=low,upperCI=up)[-7,]
pred$time<-0:5


ggplot(pred,aes(x=time,y=mean,group=1))+ 
geom_point(size=3)+
ylim(3, 4)+stat_function(fun =test)
#geom_errorbar(aes(ymin=lowerCI,ymax=upperCI,width=.1))




```

- 適合度
```
fit1.m<-round(fitMeasures(model1)[c("chisq","df","pvalue",
"cfi","srmr","rmsea")],digits=2)
fit1.m<-t(as.data.frame(fit1))
print(xtable(fit1.m),comment=F,type="html")
```
```{r, results='asis'}
fit1.m<-round(fitMeasures(model1.fit)
[c("chisq","df","pvalue",
"cfi","srmr","rmsea")],digits=2)
fit1.m<-t(as.data.frame(fit1.m))
print(xtable(fit1.m),comment=F,type="html")
```


##　期間ごとに切片が異なるモデル

```{r}
model2.2 <-'

i1 =~ 1*X1 + 1*X2 + 1*X3 + 0*X4 + 0*X5 + 0*X6
i2 =~ 0*X1 + 0*X2 + 0*X3 + 1*X4 + 1*X5 + 1*X6
s1 =~ 0*X1 + 1*X2 + 2*X3 + 3*X4 + 3*X5 + 3*X6
s2 =~ 0*X1 + 1*X2 + 4*X3 + 9*X4 + 9*X5 + 9*X6
s3 =~ 0*X1 + 0*X2 + 0*X3 + 0*X4 + 1*X5 + 2*X6

i1 ~~ i1
i2 ~~ i2
s1 ~~ s1
s2 ~~ s2
s3 ~~ s3

i1 ~~ i2 + s1 + s2 + s3
i2 ~~ s1 + s2 + s3 
s1 ~~ s2 + s3
s2 ~~ s3
i1 ~ 1
i2 ~ 1
s1 ~ 1 #do s1 ~ a*1 and s2 ~ a*1 to constrain intercepts to be equal for difference test;
s2 ~ 1
s3 ~ 1

X1 ~ 0
X2 ~ 0
X3 ~ 0
X4 ~ 0
X5 ~ 0
X6 ~ 0 '
```

```{r}
library(lavaan)
head(data)
names(data)[2:7]<-paste0("X",1:6)
model2.fit<-lavaan::growth(model2.2, data=data)

newdata2<-as.data.frame(lavPredict(model2.fit, type = "ov"))
newdata2$id<-1:length(newdata2[,1])

library(tidyr)
newdata2.l<-gather(newdata2,time,value,X1:X6)
newdata2.l$time<-as.factor(newdata2.l$time)
newdata2.l$time<-as.numeric(newdata2.l$time)-1

library(plyr)
mean.pred<-apply(newdata,2, mean)
sd.pred<-apply(newdata,2, sd)
low<-mean.pred-1.96*sd.pred
up<-mean.pred+1.96*sd.pred


pred<-data.frame(mean=mean.pred,sd=sd.pred,lowerCI=low,upperCI=up)[-7,]
pred$time<-0:5
ggplot(pred,aes(x=time,y=mean,group=1))+ 
geom_point(size=3)+
geom_line()+
ylim(3, 4)
#geom_errorbar(aes(ymin=lowerCI,ymax=upperCI,width=.1))




```

# polynomial models

## 二次以上の曲線モデル  
- quadratic curveなど
- 時間変数のコーディング要検討

```{r, out.width = 400, fig.retina = NULL}
knitr::include_graphics("img/quad.jpeg")
```

## こんなモデル

# latent basis model

## データドリブンに遷移パターンを推定
- 傾きの因子負荷を自由推定する

```{r, out.width = 400, fig.retina = NULL}
knitr::include_graphics("img/latent.jpeg")
```

## こんなモデル




