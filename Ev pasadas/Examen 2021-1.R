# Examen 2021 - 1









# 8
data = import(file.choose(), dec=",")
head(data)
opM = filter(data, Operador == "M")$Velocidad
EM.L = fitdist(opM, distr="lnorm", method="mme")$estimate
EM.G = fitdist(opM, distr="gamma", method="mme")$estimate
ks.test(opM, "plnorm", EM.L[1], EM.L[2])
ks.test(opM, "pgamma", EM.G[1], EM.G[2])


# 8.2
opE = filter(data, Operador == "E")$Velocidad
EMV.L = fitdist(opE, distr="lnorm", method="mle")$estimate
EMV.G = fitdist(opE, distr="gamma", method="mle")$estimate
ks.test(opE, "plnorm", EMV.L[1], EMV.L[2])
ks.test(opE, "pgamma", EMV.G[1], EMV.G[2])


# 9.1
opW = filter(data, Operador == "W")$Velocidad
par = fitdist(opW, method="mle", distr="weibull")$estimate
x = quantile(opW, prob=seq(0, 1, 0.2)); x
x[1] = 0; x
x[6] = Inf; x
O = hist(opW, plot=F, breaks=x)$counts
O
p = diff(pweibull(x, par[1], par[2]))
x2 = chisq.test(x=O, p=p); x2
1 - pchisq(4.2495, df=5-1-2)

# 11
X = aggregate(Velocidad ~ Ciudad, data = data, FUN = mean)[,2]
k = 4
mu0 = 10
nu0 = k/mu0
n = length(X)
sigma = sqrt(k/nu0^2)
z0 = (mean(X) - mu0) / (sigma / sqrt(n))
1 - pnorm(z0)


# 12
alpha = 0.125
qt(1-alpha/2, df=191)
0.0000149 * 47.887








