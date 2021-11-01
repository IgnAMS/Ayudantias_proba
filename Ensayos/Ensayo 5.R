# Ensayo 5
# 1)
B = 10.603
n = 4.7974
p = 1 - pweibull(5, shape=B, scale=n)

10 * 0.3 # 30 por ciento de los dias son 3 dias

# el pbinom hasta el 2 da todos las combinaciones que no lo cumplen
1 - pbinom(2, size=10, prob=p)



p# 2)
# E[Geo] = 1 / p
1 / (1 - 0.85)


# 3)
1 - pbinom(1, size=14, prob=0.05)
?pbinom

# 4)
50000 / (50/20)

# 5)
1 - pexp(9, rate=7*60)
pexp(9, rate=7)


# 6) 
mu = 14
k = (2/0.9)^2
nu = k / mu
1 - pgamma(q=20, shape=k, rate=nu)


# 7)
mu = 0.52
sigma = 0.52 * 0.96 * sqrt(3) / pi
1 - plogis(1, location = mu, scale = sigma)
1 - plogis((1-sigma)/mu)
hist(dlogis(x, location=mu, scale=sigma), freq=F, xlim = c(-1, 1)) # No se ve como el otro grafico D:



# 8)
# 5 personas por hora
# 2/3 son hombres
# velocidad de gombres: 5 * 2/3 Hombre/Hora
# duodecimo: 12, decimoquinto: 15
#  v = d/t -> t = d/v 
3 / (2/3*5)
