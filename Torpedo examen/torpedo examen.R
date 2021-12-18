# Ks test nos dice que tan bueno es un test
ks.test(X, "plnorm", lambdaEMV, zetaEMV)

# chisq test, nos da un alpha de significicancia
x = quantile(opW, prob=seq(0, 1, 0.2)); x
x[1] = 0; x
x[6] = Inf; x
O = hist(opW, plot=F, breaks=x)$counts
p = diff(pweibull(x, par[1], par[2]))
x2 = chisq.test(x=O, p=p); x2
1 - pchisq(4.2495, df=5-1-2)

# aggregate te permite dividir los datos segun el segundo termino y con la funcion fun
aggregate(Velocidad ~ Operador + Ciudad, data=data, FUN=mean)

# Regresion lineal
lm(pesocu ~ largo, data)

# var.test para mas de una
var.test(x=X, y=Y, alternative="two.sided")

# t.test para mas de una
t.test(x=X, y=Y, var.equal = F, alternative = "great")







