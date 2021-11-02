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
pgamma(q, shape=x, rate=nu)


#################
# Binomial(n, p) 
# q: cuantil
# size: numero de datos
# prob: probabilidad e exito
pbinom(q, size, prob)
# En el peor de los casos usar:
sum(dbinom(x=a:b, size, p)) # Donde a:b es el vector donde sumo


#################
# NegBinom(n, p)
# n: tamano de la muestra
# p: probabilidad
# se quiere hasta el kesimo exito, en r usa el kesimo fracaso
# En el codigo no funciona exactamnte igual
# n: numero de exitos
# x, q: es el numero de fracasos
# 2 exitos entre 5 casos con probabilidad 0.1 -> n = size = 2, q = 3, p = 0.1
dnbinom(3, 2, prob=0.1)
# dnbinom = choose(n + q - 1, n - 1) * p^n * (1-p)^q
choose(5 - 1, 2 - 1) * 0.1^2 * (1-0.1)^(5-2) # Este fue el visto en clases




