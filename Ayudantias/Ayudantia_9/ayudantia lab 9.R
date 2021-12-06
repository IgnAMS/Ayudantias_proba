###################
#  Laboratorio 9  #
###################


# F_X,Y(x,y) = P(X <= x, Y <= y)

# Creamos tabla de frecuencia, el rep permite decir la frecuencia de cada caso
Edad = c(rep(9, 1), rep(11, 4), rep(12, 2), rep(13, 1), rep(14, 1),
         rep(9, 1), rep(10, 3), rep(11, 1), rep(12, 1), rep(13, 3), rep(14, 2))
Edad
Sexo = c(rep(0, 1+4+2+1+1), rep(1, 1+3+1+1+3+2))
Sexo

data = data.frame(Sexo=Sexo, Edad=Edad)
data

tabla = table(data)
tabla

# 1 
p.prob.conjunta = prop.table(tabla)
# prop.table: divide por el numero total de datos en la tabla

# 2
# edad par y mujer
P.B = sum(p.prob.conjunta["1", c("10", "12", "14")])
P.B
sum(p.prob.conjunta[2, c(2,4,6)])
mean(data$Edad %% 2 == 0 & data$Sexo == 1)
# El modulo usa doble %%

# 3
p.X = apply(X=p.prob.conjunta, MARGIN=1, FUN=sum)
p.X

# 4
p.Y = apply(X=p.prob.conjunta, MARGIN=2, FUN=sum)
p.Y
?apply

# 5: Edad dado que soy hombre o mujer
p.Y.dado.X = prop.table(tabla, margin=1)
 
p.X.dado.Y = prop.table(tabla, margin=2)
p.X.dado.Y

# 6 verificar independencia, usar contra ejemplo P(X=x, Y=y) = P(X=x) * P(Y=y)
p.prob.conjunta["0", "9"]
p.X["0"]
p.Y["9"]
p.prob.conjunta["0", "9"] == p.X["0"] * p.Y["9"]

# 7: calcular costo esperado de funcion que varia si es hombre o mujer

Costo = function(x, y){
  costo = ifelse(x==1, 3000+150*y, 2500+120*y)
  return(costo)
}
Costo(data$Sexo, data$Edad)
mean(Costo(data$Sexo, data$Edad))

# Posson - Binomial ----------------
p = 0.6
lambda = 15
# Y ~ Poisson(lambda)
# X | Y=y ~ Binomial
p.x.y = function(x,y){
  p.conjunta = ifelse(x<=y, dbinom(x, y, p) * dpois(y, lambda), 0)
}
x = seq(0, 30)
y = seq(0, 30)
z = outer(x, y, p.x.y)
X = rep(x, times=31); X
Y = rep(y, each=31); Y
Z = c(z)

# install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(X, Y, Z, type="h", lwd=2, pch=" ", xlab='X', ylab="Y", 
              zlab=expression(P(X==x, Y==y)), highlight.3d = T, angle=45)

# Multiples variables aleatorias
alpha = 1
beta = 2
f.x.y = function(x, y){
  densidad = ifelse(x>0 & y>0, alpha*beta*exp(-alpha*x - beta*y), 0)
}
x = seq(0, 1, 0.01)
y = seq(0, 1, 0.01)
z = outer(x, y, f.x.y)

# install.packages("rgl")
library(rgl)
rgl.surface(x=x, y=z, z=y, color="red", back="lines")

X = rep(x, times=length(x))
Y = rep(y, each=length(y))
Z = c(z)

scatterplot3d(X, Y, Z, type="h", lwd=2, pch=" ", xlab="X", ylab="Y",
              zlab=expression(f(X==x, Y==y)), highlight.3d=T, angle=45)

# Funcion de variables aleatorias
n = 1000
mu = 550
sigma = 100

set.seed(1113)
X = rnorm(n=n, mean=mu, sd=sigma)
hist(X, freq=F, col="pink", border="white")
curve(dnorm(x, mean=mu, sd=sigma), add=T, lwd=2, lty=2, col="red")
Y = (X - mu)/sigma
hist(Y, freq = F, col="pink", border="white")
curve(dnorm(x, mean=0, sd=1), add=T, lwd=2, lty=2, col="red")


lambda = 100
zeta = 0.1
X = rlnorm(n=n, meanlog=lambda, sdlog=zeta)
hist(X, freq=F, col="pink", border="white")
curve(dlnorm(x, lambda, zeta), add=T, lwd=2, lty=2, col="red")
Y = log(X)
hist(Y, freq=F, col="pink", border="white")
curve(dnorm(x, lambda, zeta), add=T, lwd=2, lty=2, col="red")

alpha = 3
beta = 7
nu = 9
set.seed(1113)
X = rgamma(n=n, shape=alpha, rate=nu)
hist(X, freq=F, col="pink", border="white")
curve(dgamma(x, alpha, nu), add=T, lwd=2, lty=2, col="red")

Y = rgamma(n=n, shape=beta, rate=nu)
hist(Y, freq=F, col="pink", border="white")
curve(dgamma(x, beta, nu), add=T, lwd=2, lty=2, col="red")

Z = X + Y
hist(Z, freq=F, col="pink", border="white")
curve(dgamma(x, alpha+beta, nu), add=T, lwd=2, lty=2, col="red")







