1-pnorm((45+62)/2, mean=1.5*30, sd=8.5 * sqrt(30))
(45 + 62)/2

g = 9.8
B = 25
C = 6
C = 6
a = 23
b = B
mu.V = (a+b)/2
sigma.V = sqrt((b-a)^2/12)

a = 0
b = pi/2
q = 30
r = C
mu.T = a+q*(b-a)/(q+r)
sigma.T = sqrt(q*r*(b-a)^2/((q+r)^2 * (q+r+1)))

sqrt(sigma.V^2 * (2 * mu.V * sin(2 * mu.T)/g)^2 + sigma.T^2 * (mu.V^2 * cos(2 * mu.T) * 2 / g)^2)

# 3
1 - pnorm(sqrt(3 * 40) / (4 * pi))


# 4
qexp(0.5, rate = 10)

# 5
sigma.X = 1/2
sigma.Y = 1/2
mu.X = 1/2
mu.Y = 1/2
sigma.Z = sqrt(sigma.X^2 * (mu.Y * mu.X ^ (mu.Y - 1))^2 + sigma.Y^2 * (log(mu.X) * mu.X ^ mu.Y)^2 )
mu.Z = mu.X ^ mu.Y
sigma.Z / mu.Z

# 6
library(rio)
library(dplyr)
data = import(file.choose(), dec=',')
head(data)
hombres = dplyr::filter(data, SEXO == "Masculino")
mean(hombres$COLESTEROL > 4 * hombres$HDL)

# 7
pchisq(20 * 0.64, df = 20)

# 8
data = import(file.choose(), dec=',')
head(data)
nuevos = dplyr::filter(data, PROTOTIPO == "nuevo")$RENDIMIENTO
t.test(nuevos, mu=23, alternative="greater")

?t.test()

# 9
# dispersion < 0.57 ~ sigma < 0.57
estandar = dplyr::filter(data, PROTOTIPO == "estandar")$RENDIMIENTO
library(TeachingDemos)
?sigma.test()
sigma.test(estandar, sigma=0.57, alternative="less")
# 0.05797 >= 0.05 -> Rechazo lo propuesto

# 10 
# nuevos 
mean(nuevos > 23.5)
library(fitdistrplus)
# Estimador de momentos
EMV.N = fitdist(nuevos, distr="norm", method="mme")
EMV.L = fitdist(nuevos, distr="lnorm", method="mme")
EMV.G = fitdist(nuevos, distr="gamma", method="mme")

# Proba normal = 0.2977296
1 - pnorm(23.5, mean=EMV.N$estimate[1], sd=EMV.N$estimate[2])

# Proba lnorm = 0.2946315
1 - plnorm(23.5, EMV.L$estimate[1], EMV.L$estimate[2])

# Proba de gamma = 0.2956845
1 - pgamma(23.5, EMV.G$estimate[1], EMV.G$estimate[2])

# 11
# usar estandar
EGamma = fitdist(estandar, distr="gamma", method="mme")
# rate = 101


# 12
p0 = 1/3
p_real = 50/124
n = 124

z0 = (p_real - p0) / sqrt(p0 * (1 - p0) / n)
pnorm(z0)
z.test(x = 50/124, mu=p0, stdev=sqrt(p0 * (1 - p0)/n), alternative = "greater")

# z.test(x=30/120, mu=0.3, stdev=sqrt(0.3 * (1 - 0.3) / 120), alternative="less")
# ?z.test






