# Modelos:

#######################
# Hypergeo(n, N, m)

# n: muestra, N: Universo, m: casos favorables, x: exitos que se quieren
# en codigo no es tan así

# En codigo:
# m: casos varobales, n: casos no favorables, k: muestra, q: existos que se quieren
dhyper(x, m, n, k)


###################
# Geometrica(p)
# La probabilidad de que el primer evento n sea verdadero
# n: primer evento de exito
# q: eventos fallidos, es decir, n-1
pgeom(2, p=0.121)



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
pgamma(q, shape=x 1, rate=nu)


#################
# Binomial(n, p) 
# q: cuantil
# size: numero de datos
# prob: probabilidad e exito
pbinom(q, size, prob)
# En el peor de los casos usar:
sum(dbinom(x=a:b, size, p)) # Donde a:b es el vector donde sumo




