ALTM<-'
# posi感情のモデル
level.X =~ 1* X1 +1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
#slope.X =~  0 * X1 + 1 * X2 + 2 * X3 + 3 * X4 + 4 * X5 + 5 * X6 
#quadratic.X =~  0 * X1 + 1 * X2 + 4 * X3 + 9 * X4 + 16 * X5 + 25 * X6 


# posi認知のモデル
level.Y =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 


# 自己回帰のモデル
X2 ~ X1
X3 ~ X2
X4 ~ X3
X5 ~ X4
X6 ~ X5

Y2 ~ Y1
Y3 ~ Y2
Y4 ~ Y3
Y5 ~ Y4
Y6 ~ Y5

#交差遅延モデル
Y2 ~ X1
Y3 ~ X2
Y4 ~ X3
Y5 ~ X4
Y6 ~ X5

X2 ~ Y1
X3 ~ Y2
X4 ~ Y3
X5 ~ Y4
X6 ~ Y5

# 同時点の残差相関
X1 ~~ Y1
X2 ~~ Y2
X3 ~~ Y3
X4 ~~ Y4
X5 ~~ Y5
X6 ~~ Y6
'

ALTM2<-'
# posi感情のモデル
level.X =~ 1* X1 +1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
#slope.X =~  0 * X1 + 1 * X2 + 2 * X3 + 3 * X4 + 4 * X5 + 5 * X6 
#quadratic.X =~  0 * X1 + 1 * X2 + 4 * X3 + 9 * X4 + 16 * X5 + 25 * X6 


# posi認知のモデル
level.Y =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 


# 自己回帰のモデル
X2 ~ (a)*X1
X3 ~ (a)*X2
X4 ~ (a)*X3
X5 ~ (a)*X4
X6 ~ (a)*X5

Y2 ~ (b)*Y1
Y3 ~ (b)*Y2
Y4 ~ (b)*Y3
Y5 ~ (b)*Y4
Y6 ~ (b)*Y5

#交差遅延モデル
Y2 ~ (c)*X1
Y3 ~ (c)*X2
Y4 ~ (c)*X3
Y5 ~ (c)*X4
Y6 ~ (c)*X5

X2 ~ (d)*Y1
X3 ~ (d)*Y2
X4 ~ (d)*Y3
X5 ~ (d)*Y4
X6 ~ (d)*Y5

# 同時点の残差相関
X1 ~~ Y1
X2 ~~ Y2
X3 ~~ Y3
X4 ~~ Y4
X5 ~~ Y5
X6 ~~ Y6
'


ALTM3<-'
# posi感情のモデル
level.X =~ 1* X1 +1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
#slope.X =~  0 * X1 + 1 * X2 + 2 * X3 + 3 * X4 + 4 * X5 + 5 * X6 
#quadratic.X =~  0 * X1 + 1 * X2 + 4 * X3 + 9 * X4 + 16 * X5 + 25 * X6 


# posi認知のモデル
level.Y =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 


# 自己回帰のモデル
X2 ~ (a)*X1
X3 ~ (a)*X2
X4 ~ (a)*X3
X5 ~ (a)*X4
X6 ~ (a)*X5

Y2 ~ (b)*Y1
Y3 ~ (b)*Y2
Y4 ~ (b)*Y3
Y5 ~ (b)*Y4
Y6 ~ (b)*Y5

#交差遅延モデル
Y2 ~ X1
Y3 ~ X2
Y4 ~ X3
Y5 ~ X4
Y6 ~ X5

X2 ~ Y1
X3 ~ Y2
X4 ~ Y3
X5 ~ Y4
X6 ~ Y5

# 同時点の残差相関
X1 ~~ Y1
X2 ~~ Y2
X3 ~~ Y3
X4 ~~ Y4
X5 ~~ Y5
X6 ~~ Y6
'


ALTM4<-'
# posi感情のモデル
level.X =~ 1* X1 +1* X2 +1* X3 +1* X4 +1* X5 +1* X6 
#slope.X =~  0 * X1 + 1 * X2 + 2 * X3 + 3 * X4 + 4 * X5 + 5 * X6 
#quadratic.X =~  0 * X1 + 1 * X2 + 4 * X3 + 9 * X4 + 16 * X5 + 25 * X6 


# posi認知のモデル
level.Y =~ 1* Y1 +1* Y2 +1* Y3 +1* Y4 +1* Y5 +1* Y6 


# 自己回帰のモデル
#X2 ~ (a)*X1
#X3 ~ (a)*X2
#X4 ~ (a)*X3
#X5 ~ (a)*X4
#X6 ~ (a)*X5

#Y2 ~ (b)*Y1
#Y3 ~ (b)*Y2
#Y4 ~ (b)*Y3
#Y5 ~ (b)*Y4
#Y6 ~ (b)*Y5

#交差遅延モデル
Y2 ~ X1
Y3 ~ X2
Y4 ~ X3
Y5 ~ X4
Y6 ~ X5

X2 ~ Y1
X3 ~ Y2
X4 ~ Y3
X5 ~ Y4
X6 ~ Y5

# 同時点の残差相関
X1 ~~ Y1
X2 ~~ Y2
X3 ~~ Y3
X4 ~~ Y4
X5 ~~ Y5
X6 ~~ Y6
'

