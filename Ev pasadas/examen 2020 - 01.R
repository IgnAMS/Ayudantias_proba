# Examen 2020-01 parte 2

# 3.1
library(rio)
data = import(file.choose(), dec=",")

library(TeachingDemos)
n = length(data$EXTRANJERO)
z = (mean(data$EXTRANJERO) - 1/3) / sqrt(1/3 * (1 - 1/3) / n)
1 - pnorm(z)


z = (mean(1 - data$EXTRANJERO) - 0.5) / sqrt(0.5 * 0.5 / n)
1 - pnorm(z)
z.test(x=sum(1 - data$EXTRANJERO))

z.test(mean(data$PCR), mu=0.3, sd = sqrt(0.3 * (1 - 0.3) / n), alternative="less")


# 4.1
library(dplyr)
X = dplyr::filter(data, EXTRANJERO == 1)$EDAD
Y = dplyr::filter(data, EXTRANJERO == 0)$EDAD
t.test(x=X, y=Y, var.equal = F, alternative = "great")


# 4.2
X = dplyr::filter(data, PCR == 1)$EDAD
X = dplyr::filter(data, PCR == 0)$EDAD
t.test(x=X, y=Y, var.equal = T, alternative="great")


# 5
O = c(7, 36, 45, 23, 11) # valores de los intervalos 
p = c(0.0577, 0.2875, 0.3680, 0.2023, 0.0845) # probabilidad
X2 = chisq.test(x = O, p = p)$statistic; X2
# El chi cuadrado test toma los valores 
1 - pchisq(X2, df=5-1-2)
?chisq.test()




nrow(data)
r2 = 0.4584
n = 31 + 2
k = 1
1 - (1 - r2)*(n-1)/(n-k-1)












