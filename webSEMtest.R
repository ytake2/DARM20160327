library(RAMpath)
library(knitr)

data(ex3)
## Example 3. Growth curve models
gcm.all<-ramLCM(ex3, 1:6, ram.out=TRUE)
## plot the path diagram
bridge<-ramPathBridge(gcm.all$ram$latent, FALSE, FALSE)
plot(bridge, 'latent')


data(ex3)
test.lcs<-ramLCS(ex3, 7:12)
summary(test.lcs$lavaan, fit=TRUE)
bridge<-ramPathBridge(test.lcs$ram, allbridge=FALSE, indirect=FALSE)
plot(bridge, 'lcs')


library(semPlot)
?semPaths

library(DiagrammeR)
library(sna)
b<-read.dot("latent.dot")
grViz("lcs.dot")



data(ex3)
## Example 3. Growth curve models
gcm.all<-ramLCM(ex3, 1:6, ram.out=TRUE)
## plot the path diagram
bridge<-ramPathBridge(gcm.all$ram$latent, FALSE, FALSE)
plot(bridge, 'latent')
