# Ignacio Monardes I3 2021 - 2

# 1
k = 14
nu = 0.6
cov = k / nu^2
var.X = k / nu^2
var.Y = (2*k + k^2) / nu^2

rho = cov / (sqrt(var.X) * sqrt(var.Y))
rho

# 2
# Codigo en python: 
# rho = [[1, 0.15, 0.08], 
#         [0.15, 1, 0.78], 
#         [0.08, 0.78, 1]]
# as
# Sd = [61, 67, 35]
# Mu = [620, 672, 652]
# 
# sigma = sum(rho[i][j] * Sd[i] * Sd[j] * dg[i] * dg[j] for i in range(3) for j in range(3))
# print(sigma) # en verdad es sigma cuadrado esto
# print(sum(dg[i] * Mu[i] for i in range(3)))
sigma = sqrt(2360.0494599999997)
mu = 658.16
1 - pnorm(700, mu, sigma)


# 3
1 - pnorm(20, 20, 20/sqrt(30))


# 4
1/12

# 5
nu = 0.4
n = 30
2 * nu / n^2

# 6
theta = 3/4 # Obtenido de 7
x = 2 * theta^2 - 4 * theta + 2 
(1 - x) / 2


# 8
# Ha: mu > 12
# mu_real = 12.4
# sd_real = 0.7
# mu conocido y sd conocido
# n = 18
library(TeachingDemos)
z.test(12.4, mu=12, alternative="greater", stdev = 0.7, n = 18)
z0 = (12.4 - 12) / (0.7 / sqrt(18))
1 - pnorm(z0)
# Ambos resultados dan lo mismo! 


# 9
# El error muestral es muy grande, por ende se quiere un 
alpha = 1 - 0.95
k = qnorm(1 - alpha/2)
sigma = 0.97
n = 94
# error = k_1-a/2 * sigma / sqrt(n)
error = k * sigma / sqrt(n)
error / 2

# usando n = (k_1-a/2 * sigma / w)^2 se tiene: 
(k * sigma / (error/2))^2 

# 10
library(rio)
library(dplyr)
library(fitdistrplus)
data = import(file.choose(), dec=',')
animadas = dplyr::filter(data, Género == "Animación")$Duración
animadas
EM.G = fitdist(animadas, distr="gamma", method="mme"); EM.G
EM.L = fitdist(animadas, distr="lnorm", method="mme"); EM.L

# Calculo la empirica
mean(animadas > 120) # = 0.01775148
1 - pgamma(120, EM.G$estimate[1], EM.G$estimate[2]) # = 0.01393085
1 - plnorm(120, EM.L$estimate[1], EM.L$estimate[2]) # = 0.01638536

# Estima mejor la plnorm, se acerca mas a la teorica


# 11
terror = dplyr::filter(data, Género == "Terror")$Duración
# Ha: mu > 95
# 5% de significancia
# no se conoce sigma, procede a usar t test
t.test(terror, mu=95, alternative="greater")
# v_p < alpha: Rechaza H0 y se apoya Ha


# 12
accion = dplyr::filter(data, Género == "Acción", Año >= 2002)$Puntuación
# Ha: sigma < 1
# mu desconocido
sigma.test(accion, sigma=1, alternative="less")
(length(accion) - 1) * sd(accion)^2 / 1^2
# valor_p > alpha: No se rechaza H0











