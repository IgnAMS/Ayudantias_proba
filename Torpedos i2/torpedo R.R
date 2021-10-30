# Modelos:

#######################
# Hypergeo(n, N, m)

# n: muestra, N: Universo, m: casos favorables, x: exitos que se quieren
# en codigo no es tan así

# En codigo:
# m: casos varobales, n: casos no favorables, k: muestra, q: existos que se quieren
dhyper(x, m, n, k)



####################
# Weibul(eta, Beta)
# en codigo:
# shape: Beta
# scale: eta

pweibull(45, shape=)

######################## 
# Log-Logis(mu, sigma)
# Parece que no viene por default con esto :c, usar transformacion a logistica
# F_T(t) = F_Logis((ln(t) - mu) / sigma)
# f_T(t) = 1/(sigma * t) f_Logis((ln(t) - mu) / sigma) 
plogis(log(q), location=mu, scale=sigma)


#####################
# Logis(mu, sigma)
# location: mu
# scale: sigma
plogis(q, location=mu, scale=sigma)


################## 
# Poisson(nu * t) ~ Poisson(lambda)
# nu: ocurrencias cada t casos
# t: tiempo
# lambda: nu * t


#################
# Gamma(lambda) 
# lambda: nu * t
# Shape: cantidad de casos + 1 de 
# q: tiempo a evaluar
# rate: nu

# Probabilidad de que ocurran mas de x casos en q tiempo
pgamma(q, shape=x+ 1, rate=nu)






