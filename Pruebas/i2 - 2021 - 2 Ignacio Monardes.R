# I2 2021-2 Ignacio Monardes
# 1)
1 - pbinom(4, size=100, p=0.021)


# 2)
lambda = log(8.2)
zeta = sqrt(log(1 + 0.4^2))
1 - plnorm(15, meanlog=lambda, sdlog=zeta)
1 - pnorm((log(15) - lambda)/zeta) # Para corroborar

# 3)
# Bin - Neg
# 3 ocurrencia
pbinom(2, size=20, prob=0.13)

dnbinom(3, size=20, prob=0.13)



sum(dnbinom(x=0:2, size=20-0:2, prob=0.13))
dnbinom(x=0:2, size=20 - 0:2, prob=0.13)
dnbinom(0, 20, prob=0.13)
dnbinom(1, 19, prob=0.13)
pnbinom(2, size=20, prob=0.13)


# 4)
1 - phyper(q=2, m=0.3*150, n=0.7*150, k=11)
1 - phyper(2, m=150*0.3, n=150*0.7, k=14)
# 5)
3 / (32/24 * 0.23)
32/24 * 0.23


# 6)
n = 58.2866
B = 1.88757
qweibull(0.75, shape=B, scale=n) - qweibull(0.25, shape=B, scale=n)
qweibull(0.8, shape=B, scale=n) # Para corroborar
?qweibull


# 8)
1 - ppois(2, lambda=3 * 6 * 0.2)

# 9)
# Se demora harto!
X = c()
for(i in 1:1000000){
  Y = runif(2, min=-9, max=9)
  X = c(X, 9 < Y[1]^2 + Y[2]^2 & Y[1]^2 + Y[2]^2 < 36)
}
X
mean(X)



library(rio)
data = import(file.choose())


# 10)
X = data$PSU_M
X = c(na.omit(X))
quantile(X, 0.27)
quantile(X, 0.84)

qnorm(0.27)
qnorm(0.84)
# Solve en wolfram

lambda = 6.44917
zeta = 0.137762
# P(X > 694) = 1 - P(X <= 694)
1 - plnorm(694, meanlog=lambda, sdlog=zeta)

# 11)
# X: Lenguaje
# Y: Ranking
X = data$PSU_L
Y = data$RANKING
library(mvtnorm)
length(X); length(Y)
Aux = data.frame(X, Y)
Aux = na.omit(Aux)
Sigma = cov(cbind(Aux$X, Aux$Y))
mu = c(mean(Aux$X), mean(Aux$Y))
pmvnorm(lower=c(697, 697), upper=c(Inf, Inf), mean=mu, sigma=Sigma)[1]


# 12)
X = data$PSU_L
Y = data$PSU_C
library(mvtnorm)
length(X); length(Y)
Aux = data.frame(X, Y)
Aux = na.omit(Aux)

mu = mean(Aux$X) + cor(Aux$Y, Aux$X) * sd(Aux$X) / sd(Aux$Y) * (803 - mean(Aux$Y))
sigma = sd(Aux$X) * sqrt(1 - cor(Aux$Y, Aux$X)) 
cor(Aux$X, Aux$Y)
cor(Aux$Y, Aux$X)
1 - pnorm(710, mean=mu, sd=sigma)



X = data$PSU_L
Y = data$PSU_C
Data = as.data.frame(na.omit(cbind(X,Y)))
mu.x = mean(Data$X)
mu.y = mean(Data$Y)
sigma.x = sd(Data$X)
sigma.y = sd(Data$Y)
rho = cor(Data$X, Data$Y)
x = 710
y = 803
mu = mu.x+(y - mu.y)*sigma.x*rho/sigma.y
sigma = sigma.x*sqrt(1-rho^2)
pnorm(x, mean = mu, sd = sigma, lower.tail = F)






