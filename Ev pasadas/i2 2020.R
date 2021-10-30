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
library(rio)
data = import(file.choose())
head(data)

xp = sort(data$velocidad)
N = length(xp)
p = 1:N/(N+1)
fit1 = lm(log(xp) ~ log(-log(1 - p))) # Ajustarlo a weibul?
fit2 = lm(xp ~ qlogis(p)) # Ajustarlo a logistica
fit3 = lm(xp ~ qnorm(p)) # Ajustarlo a normal
?lm

