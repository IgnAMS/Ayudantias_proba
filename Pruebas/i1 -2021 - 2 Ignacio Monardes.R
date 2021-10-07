# P1 



# P2
choose(926, 2) / choose(926, 236) 
(236 * 235 + 249 * 248 + 227 * 226 + 214 * 213) / (926 * 925)


# P3
DyE = 0.5 - (0.6 * 2 / 3 + 0.2 * 0.38) # deportivo y sedan
DyE
DyE / 0.2 # P(E|D) = P(DyE) / P(D)
0.6 * 2 / 3 + 0.2 * 0.38 + 0.12 * 0.2

# P4


# P5
1-0.53
(1/4 * 0.47^3 * 2) + (1/4 * 0.47^2 * 2) 

(1/4 * 0.48^3 * 2) + (1/4 * 0.48^2 * 2) 

# P6
##### Simulacion ######
X = c()
for(i in 1:6){
  X = c(X, c("C"))
}
for(i in 1:40){
  X = c(X, c("A"))
}

aux = c()
m = 1000000
for(i in 1:m){ # 7 minutos
  x = sample(X, 10, replace = F) ## Lanzamiento del dado 
  if(is.na(table(x)["C"])){
    aux[i] = F # Nadie con covid
  }
  else{ # Ninguno es NA 
    aux[i] = table(x)["C"] >= 2
  }
}

mean(aux)

#### Real ######
1 - (choose(40, 10) + choose(6, 1) * choose(40, 9)) / choose(46, 10)


# P7
(1- 0.56)^2


# P8



# P9



# P10
library(dplyr)
library(rio)
data = import(file.choose(), dec=",") # Elegi el archivo
nomoscar = dplyr::filter(data, NominacionesPremiosOscar >= 1) 
not_nomoscar = dplyr::filter(data, NominacionesPremiosOscar == 0)

v1 = nomoscar$RecaudacionGlobal / 1000000
v2 = not_nomoscar$RecaudacionGlobal / 1000000

median(v1, na.rm = T) - median(v2, na.rm = T)
sd(v1, na.rm = T) - sd(v2, na.rm = T)


# P11
f1 = dplyr::filter(data, FaseMCU == 1)
f2 = dplyr::filter(data, FaseMCU == 2)
f3 = dplyr::filter(data, FaseMCU == 3) 
# heterogenea es una medida de dispersion de que tanto esta separadas las cosas
# se procedera a usar desviacion estandar
# A mayor desviacion mas heterogeneo
sd(f1$RecaudacionEEUUCanada)
sd(f2$RecaudacionEEUUCanada)
sd(f3$RecaudacionEEUUCanada)



# P12
primera = data$RecaudacionEEUUCanadaPrimeraSemana / 1000000
lambda = log(2) / median(primera)
lambda
# La probabilidad de ser mayor a 100 es 1 - F(X <= 100)
abs(mean(primera > 100) - (1 - pexp(100, rate = lambda)))









