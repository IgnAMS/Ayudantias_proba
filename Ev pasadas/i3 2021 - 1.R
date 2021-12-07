1 - pnorm(sqrt(3 * 40) / (4 * pi))
qexp(0.5, 10)


sigma.X = 1/2
sigma.Y = 1/2
mu.X = 1/2
mu.Y = 1/2

sigma.Z = sqrt(sigma.X^2 * (mu.Y * (mu.X^(mu.Y -1)))^2 + sigma.Y^2 * (log(mu.X) * mu.X^mu.Y)^2)
mu.Z = mu.X ^ mu.Y
sigma.Z / mu.Z

library(rio)
data = import(file.choose(), dec=',')
library(dplyr)
hombres = dplyr::filter(data, SEXO == "Masculino")
mean(hombres$COLESTEROL > 4 * hombres$HDL)

X = hombres$HDL
Y = hombres$COLESTEROL
Z = 4 * X - Y
mu = mean(Z)
sigma = sd(Z)
pnorm(0, mu, sigma)

pchisq(0.64 * 25, df=25)

?t.test()

data = import(file.choose(), dec=',')
nuevos = dplyr::filter(data, PROTOTIPO == "nuevo")$RENDIMIENTO
library(TeachingDemos)
t.test(nuevos, mu=23, alternative = "greater")

estandar = dplyr::filter(data, PROTOTIPO == "estandar")$RENDIMIENTO
sigma.test(estandar, sigma=0.57, alternative="less")
?sigma.test

library(fitdistrplus)
EMV.N = fitdist(nuevos, distr="norm", method="mme")
EMV.L = fitdist(nuevos, distr="lnorm", method="mme")
EMV.G = fitdist(nuevos, distr="gamma", method="mme")
mean(nuevos >  23.5)

1 - pnorm(23.5, EMV.N$estimate[1], EMV.N$estimate[2])
1 - plnorm(23.5, EMV.L$estimate[1], EMV.L$estimate[2])
1 - pgamma(23.5, EMV.G$estimate[1], EMV.G$estimate[2])

data
z.test(x=mean(estandar), mu=21.4, stdev=sqrt(21.4^2 / (length(estandar) * 2177)), alternative = "greater")

mu_real = 50/124
z.test(x=50/124, mu=1/3, stdev=sqrt(1/3 * (1 - 1/3) / 124), alternative = "greater")



1 - pexp(1, 1)
1 - pgamma(1, 1, 1)

