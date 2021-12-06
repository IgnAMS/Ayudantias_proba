## Laboratorio 10 -------

# Teo de limite central
# X1, ... , X_n ~ Exp(nu)

set.seed(1113)
y.10 = vector("numeric")
y.50 = vector("numeric")
y.100 = vector("numeric")
y.500 = vector("numeric")
rep = 1000
nu = 5

for(i in 1:rep){
  # Muestra de 10
  x = rexp(n=10, rate=nu)
  y.10[i] = sum(x)
  
  # Muestra de 50
  x = rexp(n=50, rate=nu)
  y.50[i] = sum(x)
  
  # Muestra de 100
  x = rexp(n=100, rate=nu)
  y.100[i] = sum(x)
  
  # Muestra de 500
  x = rexp(n=500, rate=nu)
  y.500[i] = sum(x)
}

par(mfrow=c(2,2), cex=0.7)
mu = 1 / nu
sigma = 1 / nu

n = 10
hist(y.10, freq=F, main=expression(n==10), col="darkblue", border="white")
curve(dgamma(x, shape=n, rate=nu), lwd=3, col="orange", lty=2, add=T)
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 50
hist(y.50, freq=F, main=expression(n==50), col="darkblue", border="white")
curve(dgamma(x, shape=n, rate=nu), lwd=3, col="orange", lty=2, add=T)
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 100
hist(y.100, freq=F, main=expression(n==100), col="darkblue", border="white")
curve(dgamma(x, shape=n, rate=nu), lwd=3, col="orange", lty=2, add=T)
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 500
hist(y.500, freq=F, main=expression(n==500), col="darkblue", border="white")
curve(dgamma(x, shape=n, rate=nu), lwd=3, col="orange", lty=2, add=T)
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)


set.seed(1113)
y.10 = vector("numeric")
y.50 = vector("numeric")
y.100 = vector("numeric")
y.500 = vector("numeric")
rep = 1000
lambda = 10

for(i in 1:rep){
  # Muestra de 10
  x = rpois(n=10, lambda=lambda)
  y.10[i] = sum(x)
  
  # Muestra de 50
  x = rpois(n=50, lambda=lambda)
  y.50[i] = sum(x)
  
  # Muestra de 100
  x = rpois(n=100, lambda=lambda)
  y.100[i] = sum(x)
  
  # Muestra de 500
  x = rpois(n=500, lambda=lambda)
  y.500[i] = sum(x)
}

par(mfrow=c(2,2), cex=0.7)
mu = lambda
sigma = sqrt(lambda)

n = 10
hist(y.10, freq=F, main=expression(n==10), col="darkblue", border="white")
x = seq(from=min(y.10), to=max(y.10))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 50
hist(y.50, freq=F, main=expression(n==50), col="darkblue", border="white")
x = seq(from=min(y.50), to=max(y.50))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 100
hist(y.100, freq=F, main=expression(n==100), col="darkblue", border="white")
x = seq(from=min(y.100), to=max(y.100))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 500
hist(y.500, freq=F, main=expression(n==500), col="darkblue", border="white")
x = seq(from=min(y.500), to=max(y.500))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)


set.seed(1113)
y.10 = vector("numeric")
y.50 = vector("numeric")
y.100 = vector("numeric")
y.500 = vector("numeric")
rep = 1000
lambda = 10

for(i in 1:rep){
  # Muestra de 10
  x = rpois(n=10, lambda=lambda)
  y.10[i] = sum(x)
  
  # Muestra de 50
  x = rpois(n=50, lambda=lambda)
  y.50[i] = sum(x)
  
  # Muestra de 100
  x = rpois(n=100, lambda=lambda)
  y.100[i] = sum(x)
  
  # Muestra de 500
  x = rpois(n=500, lambda=lambda)
  y.500[i] = sum(x)
}

par(mfrow=c(2,2), cex=0.7)
mu = lambda
sigma = sqrt(lambda)

n = 10
hist(y.10, freq=F, main=expression(n==10), col="darkblue", border="white")
x = seq(from=min(y.10), to=max(y.10))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 50
hist(y.50, freq=F, main=expression(n==50), col="darkblue", border="white")
x = seq(from=min(y.50), to=max(y.50))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 100
hist(y.100, freq=F, main=expression(n==100), col="darkblue", border="white")
x = seq(from=min(y.100), to=max(y.100))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)

n = 500
hist(y.500, freq=F, main=expression(n==500), col="darkblue", border="white")
x = seq(from=min(y.500), to=max(y.500))
points(x, dpois(x, lambda=n*lambda), lwd=10, pch=16, col="orange")
curve(dnorm(x, mean=n*mu, sd=sqrt(n) * sigma), lwd=3, col="magenta", lty=2, add=T)


## Estadisticos de orden ----
set.seed(1113)
n = 100
nu = 3
y = vector("numeric")

rep = 1000
for(i in 1:rep){
  x = rexp(n=n, rate=nu)
  y[i] = min(x)
}

par(mfrow(1, 1))
hist(y, freq=F, col="darkblue", border="white")
curve(dexp(x, rate=n*nu), col="orange", lty=2, lwd=3, add=T)



