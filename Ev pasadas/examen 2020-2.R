# Examen 20202-2

# 1 
alpha = 0.10
k = qnorm(1-alpha/2)
p = 0.15
sigma = sqrt(p * (1 - p))
(k * sigma / 0.04)^2

# 2
library(rio)
data = import(file.choose(), dec=",")
z.test()

# 3
library(dplyr)
data = import(file.choose(), dec=",")
X = filter(data, Ventas < 16)$Periódico
Y = filter(data, Ventas >= 16)$Periódico
var.test(x=X, y=Y, alternative="two.sided")

# 4
library(fitdistrplus)
EM = fitdist(data$Periódico, distr="gamma", method="mme")$estimate
ks.test(data$Periódico, "pgamma", shape=EM[1], rate=EM[2])

?ks.test()

# 5
data = import(file.choose(), dec=",")
head(data)
X = filter(data, centro == "Puerto Montt")$anillos
O = c(sum(X < 9), sum(X <= 12) - sum(X < 9), sum(X > 12))
k = length(O)
n = sum(O)
lambda = mean(X)
p1 = ppois(8, lambda=lambda)
p2 = ppois(12, lambda=lambda) - p1
p3 = 1 - p2 - p1
p = c(p1, p2, p3)
d = chisq.test(x=O, p=p)
valor.p = 1 - pchisq(0.17662, df=length(O)-1-1)


# 6
data
fit1 = lm(pesocu ~ largo, data)
fit2 = lm(pesocu ~ diametro, data)
fit3 = lm(pesocu ~ alto, data)
summary(fit1)$r.squared
summary(fit2)$r.squared
summary(fit3)$r.squared
n = 400
k = 1
1 - (1 - 0.8287) * (n - 1) / (n - k - 1)


# 12
# P(t > 1) 
1 - pgamma(1, shape=9, rate=15)











