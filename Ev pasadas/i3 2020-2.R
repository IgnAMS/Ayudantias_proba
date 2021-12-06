### I3 - 2020 - 02

# 1
library(rio)
library(rio)
library(fitdistrplus)
library(dplyr)
data = import(file.choose(), dec=',')
inteligencia = dplyr::filter(data, Tipo == "Virus", Etapa == "Mega")$Inteligencia
# T_0 que distribuye T~Student(n-1) ya que sigma es desconocido
# (mu^ - mu_0) / (sd/sqrt(n))

mu_real = mean(inteligencia)
mu_0 = 160
s = sd(inteligencia)
n = length(inteligencia)
t_0 = (mu_real - mu_0) / (s/sqrt(n))
t.test(x=inteligencia, mu=mu_0, alternative="two.sided")
?t.test

# p-value > alpha y por ende cae en H_0

# 2 
fuego = dplyr::filter(data, Atributo == "Fuego")$Velocidad
# HA: Var > 400
sigma = sd(fuego)
install.packages("TeachingDemos")
library(TeachingDemos)
sigma.test(x=fuego, sigma=20, alternative="greater")


# 3
# X: Ataque
# Y: Defensa
# Z: = (Ataque + Defensa) / 2
Z = dplyr::filter(data, Etapa == "Champion")$Ataque + dplyr::filter(data, Etapa == "Champion")$Defensa
t.test(Z, mu=220, alternative="less")


# 4
HP = data$HP
EMV = fitdist(data=HP, distr="lnorm", method="mle")
1 - plnorm(1500, meanlog=7.0603369, sdlog=0.2855065)
EM = fitdist(data=HP, distr="gamma", method="mme")
1 - pgamma(1500, shape=13.84345416, rate=0.01143252)

mean(HP>1500) # El plnorm es mas cercano

# 1500


# 5
1 - pexp(1, rate=1)
?pexp


# 9
p_0 = 0.3
p_real = 1/4
n = 120
z_0 = (p_real - p_0) / sqrt(p_0 * (1-p_0) / n)
valor_p = pnorm(z_0)

# 10
mu_muestra = 17
mu_0 = 20
s = 17
n = 100
t_0 = (mu_muestra - mu_0) / (s / sqrt(n))
pt(t_0, n-1)
pnorm(t_0)

z.test(mu_muestra, mu = mu_0, alternative = "less", stdev = s, n = n)


# 11
n = 60
mu = 2
sigma = 1
pnorm(130, mean=n*mu, sd=sigma*sqrt(n))

# 12
1-pchisq(100, df=100)











