# Ejercicios lab 4
# 1)
data = rexp(100, rate=2)
hist(data, freq=F, breaks=50, col="pink")
curve(dexp(x, rate=3), add=T, lwd=3)

# 2)
data = rlnorm(100, meanlog=0.5, sdlog=0.02)
hist(data, freq=F, breaks=50, col="pink")
curve(dlnorm(x, meanlog=0.5, sdlog=0.02), add=T, lwd=3)

# 3)
data = rnorm(100, mean=100, sd=15)
hist(data, freq=F, breaks=50, col="pink")
curve(dnorm(x, mean=100, sd=15), add=T, lwd=3)

# 4)
par(mfrow=c(2,2))
# n = 10
data = rnorm(10, mean=650, sd=50)
hist(data, freq=F, breaks=50, col="pink", main="n = 10")
curve(dnorm(x, mean=650, sd=50), add=T, lwd=3)
# n = 100
data = rnorm(100, mean=650, sd=50)
hist(data, freq=F, breaks=50, col="pink", main="n = 100")
curve(dnorm(x, mean=650, sd=50), add=T, lwd=3)
# n = 1000
data = rnorm(1000, mean=650, sd=50)
hist(data, freq=F, breaks=50, col="pink", main="n = 1000")
curve(dnorm(x, mean=650, sd=50), add=T, lwd=3)
# n = 10000
data = rnorm(10000, mean=650, sd=50)
hist(data, freq=F, breaks=50, col="pink", main="n = 10000")
curve(dnorm(x, mean=650, sd=50), add=T, lwd=3)
