2 * 3^(-4)


# Pregunta 3
mux= 1200
muy= 8
sigmax=500
sigmay=10
rho=-0.65
1 - pnorm(1500, mean = mux+rho*sigmax/sigmay*(5-muy), sd=sigmax*sqrt(1-rho^2))
delta = (sigmax*sqrt(1-rho^2)) / (mux+rho*sigmax/sigmay)


library(rio)
data = import(file.choose())
muPeso = mean(data$PESO)
sigmaPeso = sd(data$PESO)
muHg = mean(data$HG)
sigmaHg = sd(data$HG)
rho = cor(x=data$PESO, y=data$HG)

# install.packages("mvtnorm")
library(mvtnorm)
# RECOMENDABLE: USAR X E Y DESDE EL INICIO
Sigma
Sigma = cov(cbind(data$HG, data$PESO)) # mas facil
mu = c(muHg, muPeso)
pmvnorm(lower=c(-Inf, 4.5), upper=c(3, Inf), mean=mu, sigma=Sigma)[1]
pmvnorm(lower=c(-Inf, 4.5), upper=c(3, Inf), mean=mu, sigma=Sigma)

# Descubrir por que no me funciona D:

# Log normal

# X ~ Log-Normal
x80 = quantile(X, prob=0.8)
x20 = quantile(X, prob=0.2); x20


qnorm(0.8)
qnorm(0.2)

lambda = 1.2038
zeta = -2.61091
1 - plnorm(3, meanlog=lambda, sdlog=zeta)
# Cachar de ahi que onad que no funciona



# Pregunta 5 
# X: numero de adultos mayores que desean vacunarse
# X ~ Binomial(n=35, p=0.45)
pbinom(12, size=35, p=0.45)

1 - phyper(2, m=1000*0.08, n=1000*(1-0.08), k=20)




lambda = 1.27472
zeta = 0.472381
p = 1 - plnorm(7, lambda, zeta)
pbinom(2, 10, p)



nu = 232450/(365 * 24 * 60)
1/(nu * 0.12)



