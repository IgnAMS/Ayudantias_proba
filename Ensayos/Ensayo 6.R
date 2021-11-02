# Ensayo 6

# 1)
50 * 0.07
pbinom(6, size=50, prob=0.07) # 1 exito, 2 exitos, 3 exitos
sum(dbinom(x=6:50, size=50, prob=0.07)) # Esto es un buen ejemplo
1 - pbinom(44, size=50, prob=0.07)

# 2)
dhyper(x, m, n, k)
N = 14.5 * 10^6
m = N * 0.75
n = N - m
1 - phyper(350 * 0.8, m=m, n=n, k=350)


# 3) 
mu = 2.85189
sigma = 0.5
1 - plogis(log(45), location=mu, scale=sigma)


# 4) 
1 - ppois(q=12, lambda=5*2)

# 5)




