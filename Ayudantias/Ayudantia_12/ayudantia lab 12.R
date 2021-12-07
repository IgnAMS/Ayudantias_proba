# Ayudantia lab 12

n = 30
N = 2000
b = 5
a = 0
muestras = matrix(runif(n*N, min=a, max=b), nrow=n)
estadisticos = apply(muestras, 2, max)
hist(estadisticos, freq=F)
curve(n*x^(n-1)/(b^n), add=T, col="darkred", lty=2, lwd=3)


# p de bernoulli
n = 50
N = 7000
p = 0.3
muestras = matrix(rbinom(n*N, size=1, prob=p), ncol=N, nrow=n)
estadisticos = apply(muestras, 2, mean)
hist(estadisticos, freq=F, col="violet")
curve(dnorm(x, mean=p, sd=sqrt(p*(1-p)/n)), add=T, col="darkred", lty=2, lwd=3)



# lambda de poisson
n = 60
N = 1000
lambda = 15
muestras = matrix(rpois(n*N, lambda=lambda), ncol=N, nrow=n)
estadisticos = apply(muestras, 2, mean)
hist(estadisticos, freq=F, col="violet")
curve(dnorm(x, mean=lambda, sd=sqrt(lambda/n)), add=T, col="darkred", lty=2, lwd=3)

# Test para mu con sigma conocido --------------
# mu conocido = mu y varianza = sigma^2 
# mu conocido y sigma de la poblacion conocido, no se estima
library(TeachingDemos)

# Ha: mu != mu0
z.test(X, mu=mu0, sd=sigma, alternative="two.sided", conf.level=1-alpha)

# Ha: mu > mu0
z.test(X, mu=mu0, sd=sigma, alternative="greater", conf.level=1-alpha)

# Ha: mu < mu0
z.test(X, mu=mu0, sd=sigma, alternative="less", conf.level=1-alpha)

set.seed(1113)
N = 1000
mu = 55
sigma = 11
X = rnorm(n=N, mean=mu, sd=sigma)
alpha = 0.05

summary(X)

# Comparar que la media es 60
# H0: mu = mu0 vs Ha mu != mu0
mu0 = 60
z.test(X, mu=mu0, sd=sigma, alternative="two.sided", conf.level = 1-alpha)
# Como p-value < algha -> Rechazo H0, apoyo a Ha -> media != 60

# Ha: mu > mu0
z.test(X, mu=mu0, sd=sigma, alternative="greater", conf.level = 1-alpha)

# Ha: mu < mu0
z.test(X, mu=mu0, sd=sigma, alternative="less", conf.level = 1-alpha)
# pvalue < alpha por ende se concluye que mu < mu0



# Test para mu con sigma desconocido -------------------------------------------
# Se aplica el t.test
# Ha: mu != mu0
t.test(X, mu=mu0, alternative="two.sided")

# Ha: mu>mu0
t.test(X, mu=mu0, alternative = "greater")

# Ha: mu<mu0
t.test(X, mu=mu0, alternative="less")

# Test para sigma con mu desconocido: chi^2(n-1) -------------------------------
# Ha: sigma^2 != sigma0^2
sd(X)
sigma0 = 12
sigma.test(X, sigma=sigma0, alternative="two.sided")


# Ha: sigma > sigma0
sigma.test(X, sigma=sigma0, alternative="greater")

# Ha: sigma<sigma0
sigma.test(X, sigma=sigma0, alternative="less")


# Test para la proporcion p de una bernoulli -----------------------------------
set.seed(1113)
N = 500
p = 0.4
X = rbinom(n=1, size=N, prob=p)
X 
X/N

p0 = 0.3
# Ha: p != p0
prop.test(X, n=N, p=p0, alternative="two.sided", correct=F)

# Ha: p < p0
prop.test(X, n=N, p=p0, alternative="less", correct=F)

# Test para comparacion de varianzas -------------------------------------------
# Dadas dos distribucioens X_i y Y_i que vienen de una Normal
# Se quiere comparar sigma1^2 y sigma2^2 
# Ha: sigma1^2 != sigma2^2
# F0 = S1^2/S2&2 ~ F(eta= n1 - 1, nu = n2 = 2)
set.seed(1113)
N = 1000
mu = 55
sigma = 11
X = rnorm(n=N, mean=mu, sd=sigma)
N = 500
mu = 60
sigma=13
Y = rnorm(n=N, mean=mu, sd=sigma)

alpha = 0.05

var(X); var(Y)
var(X)/var(Y)

# Ha: sigma1^2/sigma2^2 != 1
var.test(x=X, y=Y, alternative="two.sided", conf.level=1-alpha)
# pvalue < alpha -> son distintas

#Ha: sigma1^2/sigma2^2 > 1
var.test(x=X, y=Y, alternative="greater", conf.level=1-alpha)

# Ha: sigma1^2/sigma2^2 < 1
var.test(x=X, y=Y, alternative="less", conf.level=1-alpha)


# Bondad de ajuste -------------------------------------------------------------
# Test X^2 
# X^2 > c_1-alpha(f) Se rechaza la H0
# k >= 5 y E_i >= 5

set.seed(1113)
n = 600
k = 3
nu = 0.2
X = rgamma(n, k, nu)
hist(X, col="violet", breaks=seq(0, 55, 11))
summary(X)
aux = hist(X, col="violet", breaks=seq(0, 55, 11))
O = aux$counts
O

# Ej 1: 
# HO: X~LogNormal vs Ha: X !~ LogNormal
# 1. Estimar lamdba y zeta
library(fitdistrplus)
EMV = fitdist(data=X, distr="lnorm", method="mle")
lambdaEMV = EMV$estimate[1]
zetaEMV = EMV$estimate[2]
c(lambdaEMV, zetaEMV)

hist(X, col="gray", border="white", freq=F, ylab="", xlab=expression(Theta[X]), 
     main="Hist de densidad", ylim=c(0, 0.07))
curve(dlnorm(x, meanlog=lambdaEMV, sdlog=zetaEMV), add=T, col="blue", lty=2, lwd=3)

# Estimamos las prob de 0, 11, 22, 33, 44, 55
p1 = plnorm(11, lambdaEMV, zetaEMV)
p2 = plnorm(22, lambdaEMV, zetaEMV) - p1
p3 = plnorm(33, lambdaEMV, zetaEMV) - p2 - p1
p4 = plnorm(44, lambdaEMV, zetaEMV) - p3 - p2 - p1
p5 = 1 - p4 - p3 - p2 - p1
p = c(p1, p2, p3, p4, p5)
p
sum(p)

E = n * p; E

Tabla = cbind(O, E, (O-E)^2/E); Tabla
Tabla = rbind(Tabla, apply(Tabla, 2, sum)); Tabla
colnames(Tabla) = c("Observado", "Esperado", "(O-E)^2/E")
rownames(Tabla) = c("<11", "11-22", "22-33", "33-44", ">44", "Total")

Tabla


# Estadistico de prueba X^2 ~ Chi-cuadrado(k2 - 1 -v)
# k2: numero de intervalos
# v: numero de parametros estimados
X2 = Tabla[6, 3]

# Cuando es muy grande rechazo el modelo, cuando es cercano a 0 no lo rechazo
k2 = length(O); k2
v = 2
curve(dchisq(x, df=k2-1-v), col="darkred", lty=2, lwd=3, xlim=c(0, 20))

alpha = 0.05

z = seq(qchisq(1-alpha, df=k2-1-v), 20, 0.01)
lines(dchisq(z, df=k2-1-v)~z, lty=2, lwd=3, col="blue", type="h")

abline(v=X2, lty=2, lwd=3, col="red")
abline(v=qchisq(1-alpha,df=k2-1-v), lty=2, lwd=3, col="blue")
# Se rechaza el modelo! 

chisq.test(x=O, p=p)
 
# Test de kolmogorov ---------------------------
# H0: X~Normal vs X!~Normal
mu = mean(X)
sigma = sd(X)
z = sort(X)
N = length(X)
p = 1:N/(N+1)
plot(p~z, type="s")

ks.test(X, "pnorm", mu, sigma)
# valor p < alpha: se rechaza H0

# H0: X~LogNorm
curve(plnorm(x, lambdaEMV, zetaEMV), col="violet", lwd=2, lty=2)
ks.test(X, "plnorm", lambdaEMV, zetaEMV)
# valor p > alpha, no existe evidencia suficeinte para rechazar H0
# Concluyo que X~LogNorm












 