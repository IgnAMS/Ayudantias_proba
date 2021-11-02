# I2 2020-2 Proba

# 1)
pnbinom(50 - 6, size=6, prob=0.07)
x = 6:50
sum(dnbinom(x-6, size=6, prob=0.07))
choose(49, 5) * 0.07^6 * (1 - 0.07)^44
dnbinom(50 - 6, size=6, prob=0.07)

# 2)
N = 14.5 * 10^6
m = 0.75 * N
n = N - m
k = 350

1-phyper(q=0.8*k, m=m, n=n, k=350)

# 3)
# a)
(1-pweibull(45, shape=1.43138, scale=23.8791)) * 100
# b)

(1 - plogis(log(45), scale=0.5, location=2.85189))*100


# 4)
pgamma(2, shape=13, rate=5)
1-ppois(12, lambda=5*2)
1-ppois(12, lambda=4*3)



# 5)
# No entra en la i2


# 6)
# a)
library(rio)
data = import(file.choose())
head(data)

xp = sort(data$velocidad)
N = length(xp)
p = 1:N/(N+1)
fit1 = lm(log(xp) ~ log(-log(1 - p))) # Ajustarlo a weibul
fit2 = lm(xp ~ qlogis(p)) # Ajustarlo a logistica
fit3 = lm(xp ~ qnorm(p)) # Ajustarlo a normal
fit1

summary(fit1)$adj.r.squared
summary(fit2)$adj.r.squared
summary(fit3)$adj.r.squared

# Se ajusta mejor como weibull

# Rango intercuartilico
qweibull(0.75, shape=1/fit1$coef[2], scale=exp(fit1$coef[1])) -
  qweibull(0.25, shape=1/fit1$coef[2], scale=exp(fit1$coef[1]))


# b)
xp = sort(data$HP)
N = length(xp)
p = 1:N/(N+1)
fit1 = lm(log(xp) ~ log(-log(1 - p))) # Ajustarlo a weibul
fit2 = lm(xp ~ qlogis(p)) # Ajustarlo a logistica
fit3 = lm(log(xp) ~ qlogis(p)) # Ajustarlo a log-logistica
fit1

summary(fit1)$adj.r.squared
summary(fit2)$adj.r.squared
summary(fit3)$adj.r.squared

# Se ajusta mejor logisitica

1-plogis(100, location=fit2$coef[1], scale=fit2$coef[2])



# c)

xp = sort(data$defensa)
N = length(xp)
p = 1:N/(N+1)
fit1 = lm(log(xp) ~ log(-log(1 - p))) # Ajustarlo a weibul
fit2 = lm(log(xp) ~ qlogis(p)) # Ajustarlo a log-logistica
fit3 = lm(log(xp) ~ qnorm(p)) # Ajustarlo a log-normal
fit1

summary(fit1)$adj.r.squared
summary(fit2)$adj.r.squared
summary(fit3)$adj.r.squared

# Se ajusta mejor a fit2 -> log-logistica

plogis(log(75), location=fit2$coef[1], scale=fit2$coef[2])

# 7)
# sigma2 = cov(cbind(X, Y))
# pmvnorm(lower=c(80, 160), upper=c(Inf, Inf), mean=mu, sigma=sigma2)











