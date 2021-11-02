# Ayudantia 9

# 4)
library(rio)
library(dplyr)
data = import(file.choose())
head(data)
mujeres = filter(data, SEXO  == "Femenino")
mujeres
library(mvtnorm)
X = mujeres$COLES
Y = mujeres$IMC
mu.x = mean(X)
mu.y = mean(Y)
Sigma = cov(cbind(X, Y)) 
pmvnorm(lower=c(180, 20), upper=c(Inf, 30), mean=c(mu.x, mu.y), sigma=Sigma)[1]
mean(mujeres$COLESTEROL > 180 & 20 < mujeres$IMC & mujeres$IMC < 30)
