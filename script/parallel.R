parallel<-'
# posi感情のモデル
level.X =~ 1* X1 +1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
slope.X =~  0 * X1 + 1 * X2 + 2 * X3 + 3 * X4 + 4 * X5 + 5 * X6 
quadratic.X =~  0 * X1 + 1 * X2 + 4 * X3 + 9 * X4 + 16 * X5 + 25 * X6 

# posi認知のモデル
level.Y =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 
'

parallel2<-'
# posi感情のモデル
level.X =~ 1* X1 +1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
slope.X =~  0 * X1 + 1 * X2 + 2 * X3 + 3 * X4 + 4 * X5 + 5 * X6 
quadratic.X =~  0 * X1 + 1 * X2 + 4 * X3 + 9 * X4 + 16 * X5 + 25 * X6 

# posi認知のモデル
level.Y =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6

#残差相関
X1 ~~ Y1
X2 ~~ Y2
X3 ~~ Y3
X4 ~~ Y4
X5 ~~ Y5
X6 ~~ Y6
'