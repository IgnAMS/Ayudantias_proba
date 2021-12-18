data = import(file.choose(), dec=",")

p0 = 1/3
n = length(data$EXTRANJERO)
z0 = (mean(data$EXTRANJERO) - p0) / (sqrt(p0 * (1 - p0) * n) / n)
1 - pnorm(z0)

X = filter(data, EXTRANJERO == 1)$EDAD
Y = filter(data, EXTRANJERO == 0)$EDAD
t.test(x=X, y=Y, var.equal=F, alternative="greater")

O = c(7, 36, 45, 23, 11)
p = c(0.0577, 0.2875, 0.3680, 0.2023, 0.0845)
X2 = chisq.test(x=O, p=p)
1 - pchisq(0.18561, df = 5 - 1 - 2)

# Ha: mediana > 25
# Mediana log normal = e^lambda
# mean(log(X)) = meanlog = lambda
lambda = 401.9215 / 122
mediana_real = exp(lambda)
mediana0 = 25
# var = E(X^2) - E(X)^2 = E(log(X)^2) - E(log(X))^2
zeta = sqrt(1328.496/122 - (401.9215/122)^2)
sigma = 
z0 = (mediana_real - mediana0) / (sqrt())

data = import(file.choose(), dec=",")
X = aggregate(Velocidad ~ Ciudad, data = data, FUN = mean)[,2]
xp = sort(X)
N = length(X)
p = 1:N/(N+1)
par = lm(log(xp)~qnorm(p))$coef
par


