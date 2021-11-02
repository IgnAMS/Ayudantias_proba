# Ayudantia 5 catedra

# 1)
# a)
1 - pweibull(5 ,shape=1, scale=2)

# b)
ppois(3, lambda=6/24*8)
1 - pgamma(8, shape=4, rate=6/24)

# c)
p = 1 - pgamma(5, shape=1, scale=2)
pnbinom(2, size=2, prob=p) # El pimer parametro es la cantidad de fallas


# d)
1 - pgamma(20, shape=1, rate=1/40)
 

# 2)
1 - pbinom(0, size=25, prob=0.15)
1 - phyper(0, m=1000*0.15, n=1000*0.85, k=25)


# 3)
1 - pgamma(60, shape=3, rate=4/60) # que en 60 minutos ocurran 2 eventos
ppois(2, lambda=4)

k = 1/(0.5)^2
nu = k / 4

# P(D>=8)
p = 1 - pgamma(8, shape=k, rate=nu)
(1- p)^3*p # que el cuarto sea el correcto
(1 - p)^3 # que los tres primeros no sean

# 4)

lambda = log(2)
delta = 0.6
zeta = sqrt(log(1 + 0.6^2))
p = 1 - plnorm(3, meanlog=lambda, sdlog=zeta); p
q = 1 - plnorm(4, meanlog=lambda, sdlog=zeta); q

# Y ~ Gamma(k=2, lambda=lambda*q)
# E[Gamma] = k / lambda
2/((4/p) * q)
p / (2 * q)
