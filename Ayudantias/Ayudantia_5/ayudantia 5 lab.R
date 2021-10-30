# Lab 5 catedra
set.seed(1113) # Fija una semilla para poder mantener la variabilidad
x = rnorm(10, mean=10, sd=2)
x

# Distribucion hipergeometrica: Lote de tamano N y m defectuoso
# Prob de x defectuosos de una muestra de tamaño n: 
# p_x(x) = choose(m, x) * choose(N - m, n - x) / choose(N, n)
dhyper(x, m, n, k) # m: bolas blancas, n: bolas negras, k: muestra, x: blancas extraidas
dhyper(2, 3, 4, 5)

rhyper(nn, m, n, k) # Se usa doble nn para poder diferenciar de n
# Media teorica es E(x) = k * p, p = m / (m + n)
# Varianza teorica: Var(X) = k * p * (m+n-k) / (m+n-1)

# 17 bolas blancas y 23 negras, se extraen 15 al azar. Distribucion?
nmuestra= 120
m = 17
n = 23
k =  15 
X = rhyper(nn=nmuestra, m, n, k)
X
maximo = min(m, k); maximo
table(X)
proptable = prop.table(table(X)) # Tabla de probabilidades
sum(proptable)
plot(proptable, xlim=c(0, maximo), col="orange", lwd=4)
x = 0:maximo; x
axis(side=1, at=x) # Le pongo numerito a todos los numeritos
dhyper(x, m, n, k)
sum(dhyper(x, m, n, k))
points(x, dhyper(x, m, n, k), lwd=10, pch=16, col="darkblue") # Puntos de la probabilidad


# Media muestral
mean(X)
abline(v=mean(X), col="red", lty=2, lwd=2)
# Media teorica
p = m / (m + n)
k * p
abline(v=k*p, col="darkgreen", lty=2, lwd=2)

# Moda muestral
library(modeest)
mlv(X) # 6 es la moda, ademas es donde hay mas frecuencia
# Moda teorica
dhyper(x, m, n, k) == max(dhyper(x,m,n,k))
X[dhyper(x, m, n, k) == max(dhyper(x,m,n,k))] # No funciono xd
qhyper(0.5, m, n, k) # Este funciona mejor asdkasodkaskod


# Esperanza matematica de g(X) = X^2
g = function(X){
  X^2
}
mean(g(X))



# Percentil teorico 
quantile(X, seq(from=0, to=1, by=0.1))
qhyper(seq(from=0, to=1, by=0.1), m, n, k)


# Varianza y desviacion estandar
# Muestral
var(X)
# Teorico
k * p * (1 - p) * (m + n - k) / (m + n - 1)

# Desviacion estandar
# Muestral
sd(X)
# Teorica
sqrt(k * p * (1 - p) * (m + n - k) / (m + n - 1))

# Rango 
# Muestral
Rango = function(X){
  max(X) - min(X)
}
Rango(X)
range(X)
range(X)[2] - range(X)[1]
# Teorico
maximo-0


# Rango intercuartilico
# Muestral
IQR = function(X){
  quantile(X, 0.75) - quantile(X, 0.25)
}
quantile(X, 0.75)
quantile(X, 0.25)
IQR(X)
# Teorico
qhyper(0.75, m, n, k) - qhyper(0.25, m, n, k)

# si mu > 0, usar el coef de variacion! 
# Muestral
sd(X)/mean(X)
# Teorica
sqrt(k * p * (1 - p) * (m + n - k) / (m + n - 1)) / (k * p)

# Skewness: tercer momento central
# install.packages("moments")
library(moments)
# Muestral
skewness(X)


# Kurtosis: cuarto momento central
kurtosis(X) - 3

# Relacion entre distribuciones
# COV(X, Y) = E[(X-mu_x) (Y-mu_y)] = E(X Y) - mu_x * mu_y
# Corr(X, Y) = COV(X, Y) / (sigma_x * sigma_y)
cov() 
cor()


# Creamos nueva variable Y ~ Binomial(n=k, p=p)
set.seed(1113)
Y = rbinom(120, size=k, prob=p)
maximo=k; maximo
table(Y)
proptable = prop.table(table(Y))
plot(proptable, xlim=c(0,maximo), col="orange", lwd=4)
x=0:maximo
axis(1,at=x)
points(x, dbinom(x, size=k, prob=p), lwd=10, pch=16, col="darkblue")
plot(X, Y, pch=16) # Weird, no paso lo mismo D:
# Covarianza
cov(X, Y)
# Correlacion muestral
cor(X, Y)

cov(X, Y) / (sd(X) * sd(Y))

