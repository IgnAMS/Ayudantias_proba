## Laboratorio 11

f = function(x, a){
  (x-a)**2
}


# Optimize es para univariable
curve(f(x, a=1/3), xlim=c(0, 1))
xmin = optimize(f, c(0, 1), tol=0.0001, a=1/3); xmin
xmax = optimize(f, c(0, 1), tol=0.0001, a=1/3, maximum=T); xmax

points(xmin$minimum, xmin$objective, col="red", lwd=3)
points(xmax$maximum, xmax$objective, col="blue", lwd=3)


# Optim es  para multivariable
fr = function(x){
  x1 = x[1]; x2 = x[2]
  100 * (x2 - x1 * x1) ** 2 + (1 - x1) ** 2
}

optim(c(-1.2, 1), fr) # se les da los dos valores



## fitdist ----
# Encontrar estimador de momentos y maximo verosimil de una funcion de una dist
# univariada, cargar fitdistrplus

# install.packages("fitdistrplus")
library(fitdistrplus)

set.seed(1113)
x2 = rnorm(n=250, mean=10, sd=4)
# Metodo de momentos
EM = fitdist(data=x2, distr="norm", method="mme"); EM
# Maximo de verosimilitud
EMV = fitdist(data=x2, distr="norm", method="mle"); EMV

EMV$estimate

set.seed(1113)
lambda = 3
zeta = 1

x3 = rlnorm(n=250, meanlog=lambda, sdlog=zeta)
# EM: Metodo de momentos
EM = fitdist(data=x3, distr="lnorm", method="mme"); EM
# EMV: Estimador de maximo de verosimilitud
EMV = fitdist(data=x3, distr="lnorm", method="mle"); EMV
hist(x3, freq=F, breaks=30)
curve(dlnorm(x, meanlog=lambda, sdlog=zeta), add=T, col="blue", lwd=3)
curve(dlnorm(x, meanlog=EM$estimate[1], sdlog=EM$estimate[2]), add=T, col="darkred", lwd=3, lty=2)
curve(dlnorm(x, meanlog=EMV$estimate[1], sdlog=EMV$estimate[2]), add=T, col="purple", lwd=3, lty=2)
legend("topright", col=c("blue", "red", "purple"), lty=c(1,2,2), lwd=c(3,3,3), c("Teorica", "EM", "EMV"))


n = 500
lambda = 1.2
zeta = 0.3
set.seed(1113)
Y = rlnorm(n=n, meanlog=lambda, sdlog=zeta)
hist(Y, freq=F, border="white", col="violet", main="Log-Normal", ylab="Densidad", xlab="Muestra")
x = sort(Y)
p = 1:n/(n+1)
# Fit de linear regression
fit = lm(log(x) ~ qnorm(p))
fit

lambda.qq = fit$coefficients[1]
zeta.qq = fit$coefficients[2]

zeta.em = sqrt(log(mean(Y^2)) - 2*log(mean(Y))); zeta.em
lambda.em = log(mean(Y)) - 0.5*zeta.em^2; lambda.em

EM = fitdist(data=Y, distr="lnorm", method="mme"); EM
EM$estimate

fit = fitdist(data=Y, distr="lnorm", method="mle")
fit$estimate

lambda.emv = fit$estimate[1]
zeta.emv = fit$estimate[2]

curve(dlnorm(x, meanlog=lambda.qq, sdlog=zeta.qq), col="darkblue", add=T, lwd=3, lty=2)
curve(dlnorm(x, meanlog=lambda.em, sdlog=zeta.em), col="darkred", lty=3, add=T, lwd=3)
curve(dlnorm(x, meanlog=lambda.emv, sdlog=zeta.emv), col="darkgreen", lty=3, add=T, lwd=3)
curve(dlnorm(x, meanlog=lambda, sdlog=zeta), col="orange", lty=3, add=T, lwd=3)

lambda; lambda.qq; lambda.em; lambda.emv
zeta; zeta.qq; zeta.em; zeta.emv















