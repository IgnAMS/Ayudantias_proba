####################
#     Lab 7        #
####################

# lm hace regresiones lineales, estudia intercepto y pendiente de una recta x
# y = B_0 + B_1 x 
# Cumple o no cumple -> Bernoulli
# Numero de evcentos en periodos -> Poisson
# Tiempos de duracion o espera -> Exponencial
# Suma de eventos individuales -> Normal
# Condiciones extremas de un proceso -> Valor extremo

lm(y ~ x)

# Determinar empiricamente los datos


# Grafico de probabilidad, N observaciones, m-esimo valor
# Acumulada vs acumulada empirica de los datos
# P_k = k / (N+1)
# Normal: x_q = mu + sigma * Phi^{-1}(p_q)
n = 300
mu = 10
sigma = 2
set.seed(1113)
y = rnorm(n, mean=mu, sd=sigma)
y = sort(y)
N = length(y)
m = 1:N
x = m/(N+1)
p = seq(from=0, to=1, by=0.05)  # percentiles
plot(
  qnorm(x), y, xaxt="n", ylab="Valores de Y", xlab="Probabilidad acumulada", 
  bty="n", lwd=2, las=1
)
axis(1, at=qnorm(p), label=p, las=1, lwd=0.5) # Poner eje x
lm(y ~ qnorm(x)) # y respecto a qnorm(x)
modelo = lm(y ~ qnorm(x))
modelo$coefficients # Puedo acceder a los coeficientes

valores = modelo$coefficients
hat.mu = valores[1]
hat.sigma = valores[2]
hat.mu; hat.sigma # Se acercan bastante a 10 y 2 dados inicialmente
abline(a=hat.mu, b=hat.sigma, lwd=2, col="blue")

hist(
  y, freq=F, col="darkred", border="white", las=1, main="Histograma con ajuste Normal"
)
curve(dnorm(x, mean=hat.mu, sd=hat.sigma), add=T, lwd=2, lty=2, col="Blue")
# Se escapa un poco de los limites entre el 9 y el 10


# Log-Normal ---------------------
n = 300
lambda = 2
zeta = 0.4
set.seed(1113)
y = rlnorm(n, meanlog=lambda, sdlog=zeta)
y = sort(y)
N = length(y)
m = 1:N
x = m/(N+1)
p = seq(from=0, to=1, by=0.05)  # percentiles
plot(
  qnorm(x), log(y), xaxt="n", ylab="Valores de Y", xlab="Probabilidad acumulada", 
  bty="n", lwd=2, las=1
)
axis(1, at=qnorm(p), label=p, las=1, lwd=0.5) # Poner eje x
lm(log(y) ~ qnorm(x)) # y respecto a qnorm(x)
modelo = lm(log(y) ~ qnorm(x))
modelo$coefficients # Puedo acceder a los coeficientes

valores = modelo$coefficients
hat.lambda = valores[1]
hat.zeta = valores[2]
hat.lambda; hat.zeta # Se acercan bastante a 10 y 2 dados inicialmente
abline(a=hat.lambda, b=hat.zeta, lwd=2, col="blue")

hist(
  y, freq=F, col="darkred", border="white", las=1, main="Histograma con ajuste Normal"
)
curve(dlnorm(x, meanlog=hat.lambda, sdlog=hat.zeta), add=T, lwd=2, lty=2, col="Blue")
# Se ajusta bastante bien B)


# Gamma con ajuste normal y log normal ------------------
k = 10
nu = 0.1
n = 300
y = rgamma(n, rate=nu, shape=k)
hist(
  y, freq=F, col="darkred", 
  border="white", main="Histograma de distribucion gamma",
  las=1   
)

# qqplot Normal -------------
par(mfrow=c(1, 2), cex=0.8) # una fila y dos columnas
y = sort(y)
N = length(y)
m = 1:N
x = m/(N+1)
p = seq(from=0, to=1, by=0.05)  # percentiles
plot(
  qnorm(x), y, xaxt="n", ylab="Valores de Y", xlab="Probabilidad acumulada", 
  bty="n", lwd=2, las=1, main="Distribucion normal"
)
axis(1, at=qnorm(p), label=p, las=1, lwd=0.5) # Poner eje x
lm(y ~ qnorm(x)) # y respecto a qnorm(x)
modelo = lm(y ~ qnorm(x))
modelo$coefficients # Puedo acceder a los coeficientes

valores = modelo$coefficients
hat.mu = valores[1]
hat.sigma = valores[2]
hat.mu; hat.sigma # Se acercan bastante a 10 y 2 dados inicialmente
abline(a=hat.mu, b=hat.sigma, lwd=2, col="blue")


# qqplot Log-Normal --------------

y = sort(y)
N = length(y)
m = 1:N
x = m/(N+1)
p = seq(from=0, to=1, by=0.05)  # percentiles
plot(
  qnorm(x), log(y), xaxt="n", ylab="Valores de Y", xlab="Probabilidad acumulada", 
  bty="n", lwd=2, las=1, main="Distribucion Log-Normal"
)
axis(1, at=qnorm(p), label=p, las=1, lwd=0.5) # Poner eje x
lm(log(y) ~ qnorm(x)) # y respecto a qnorm(x)
modelo = lm(log(y) ~ qnorm(x))
modelo$coefficients # Puedo acceder a los coeficientes

valores = modelo$coefficients
hat.lambda = valores[1]
hat.zeta = valores[2]
hat.lambda; hat.zeta # Se acercan bastante a 10 y 2 dados inicialmente
abline(a=hat.lambda, b=hat.zeta, lwd=2, col="blue")

# Log normal se ve mas bonito



# Histograma -------------------
par(mfrow=c(1, 2), cex=0.8)
hist(
  y, freq=F, col="darkred", border="white", las=1, main="Histograma",
  ylim=c(0, 0.013)
)
curve(dnorm(x, mean=hat.mu, sd=hat.sigma), add=T, lwd=2, lty=2, col="darkblue")
curve(dlnorm(x, meanlog=hat.lambda, sdlog=hat.zeta), add=T, lwd=2, lty=2, col="darkgreen")
legend(
  "topright", col=c("darkblue", "darkgreen"), lwd=c(2,2), c("Normal", "Log-Normal"),
  cex=1, bty="n", lty=c(2,2)
)

# Weibull ----------------------

set.seed(1113)
n = 300
beta = 0.8
eta = 0.2
X = rweibull(n, shape=beta, scale=eta)


QQ.Weibull = function(y){
  x = sort(y)
  N = length(y)
  p = (1:N)/(N+1)
  plot(
    log(x) ~ log(-log(1 - p)), pch=20, col="darkblue", bty="n", las=1,
    main=expression("QQ-Weibull"),
    ylab=expression(log(x[p])),
    xlab=expression(log(-log(1-p))),
  )
  abline(lm(log(x) ~ log(-log(1 - p))), lwd=3, col="darkorange")
  aux = lm(log(x) ~ log(-log(1 - p)))
  aux
}


hat.eta = as.numeric(exp(QQ.Weibull(X)$coef[1]))
hat.beta = as.numeric(1/QQ.Weibull(X)$coef[2])
eta; beta

# log(eta) + 1/B log(-log(1-p)) = log(x)
# exp(intercepcion) = eta
# 1 / pendiente = beta

hist(
  X, freq=F, col="darkred", border="white", 
  main="Histograma de weibull", las=1, nclass=30
)
curve(dweibull(x, shape=beta, scale=eta), lwd=3, col="darkblue", add=T)
# Se ajusta bien si es una muestra muy muy grande




