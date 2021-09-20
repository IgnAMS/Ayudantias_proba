#######################
## Script - Clase 10 ##
#######################

## X: Tiempo entre mensajes de whatsApp (reporte alumnos)
X = c(3,31,1,4,13,6,121,23,3,11,25,2,0,4,8,21,5,111,37,0,6,7,2,77,14,2,26,60,21,1,1,90,15,22,2,7,12,10,9,22,1,14,5,3,6,4,2,21,20,9,14,8,22,0,1,5,3,21,33,8,7,15,6,4)

## Histograma de Frecuencia
hist(X) ## Se observa un decaimineto exponecial(lambda) --> ¿lambda?

## Utilicemos la relación que existe entre medidas empiricas y teóricas
## mean(X) = E(X) = 1/lambda
## median(X) = x50 = log(2)/lambda
## sd(X) = sqrt(Var(X)) = 1/lambda
lambda = 1 / mean(X) 
hist(X, freq = F, breaks = seq(0,160,5), border = "white", main = "")
curve(dexp(x, rate = lambda), from = 0,to = 140, n = 1000, add = T, col = "red")
lambda = log(2)/median(X) 
curve(dexp(x, rate = lambda), from = 0,to = 140, n = 1000, add = T, col = "blue")
lambda = 1/sd(X) 
curve(dexp(x, rate = lambda), from = 0,to = 140, n = 1000, add = T, col = "orange")
legend("topright", c("median", "mean", "sd"), col = c("blue", "red", "orange"), 
bty = "n", lty = 1)
