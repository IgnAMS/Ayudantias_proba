# I2 - 2020 - 01
# 1)
qnorm(0.3)
qnorm(0.5)

1-pnorm(24, 10, 7.62776)

# 2)
delta = 0.33
zeta = sqrt(log(1+delta^2))
lambda = log(5)
plnorm(8, meanlog=lambda, sdlog=zeta)


# Binomial
p = 0.12 * (1 - 0.11) + (1 - 0.12) * 0.09
0.09 * (1 - 0.12) + (1 - 0.11) * 0.12
sum(dbinom(x=3:10, size=10, prob=p))
1 - pbinom(2, size=10, prob=p)


# Hyper geo
1 - phyper(0, m=4, n=44-4, k = 6-1)

# Creo que es 
pgeom(q=3, prob=0.121)
pgeom(q=0, prob=0.121)
sum(dgeom(x=0:2, prob=0.121))
1-(1-0.121)^3

pnorm(0.033)

qnorm()