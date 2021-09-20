#############################################
#############################################
#             Ayudantia 3                   #
#############################################
#############################################

getwd()
setwd("C:/Users/iamsm/Documents/Acceso UC/Proba/Ayudantias_proba_R/Ayudantia_3")
x <- 1:10

sum(x)
prod(x)
choose(10, 3)
?choose

factorial(10)
factorial(700)
factorial(40)

sample(x, size=5, replace=T) # Muestra de x tamaño n con o sin reemplazo
sample(x, size=5, replace=F) # Sin reemplazo
sample(x=x, size=5, replace=T)

round(0.1234567, digits=5)
round(0.1234567, digits=4)
round(0.1234567, digits=3)

trunc(1.234567) # Trunca

mean(x)

setwd("C:/Users/iamsm/Documents/Acceso UC/Proba/Ayudantias_proba_R/Ayudantia_2")
getwd()
library(rio)
data = import(file.choose(), dec=",") # Importante, sin el dec los lee mal como si fueran strings
data$Dia = factor(data$Dia)
data$Pronostico = factor(data$Temperatura)
data$Humedad = factor(data$Humedad)
data$Viento = factor(data$Viento)
data$Juega_Tenis = factor(data$Juega_Tenis)
data
str(data)
table(data$Temperatura) # Nos permite sacar la moda

min(data$Temperatura_Minima)
data$Temperatura_Minima == min(data$Temperatura_Minima) # Filtro
data[data$Temperatura_Minima == min(data$Temperatura_Minima),] # Vemos los datos del mínimo

# Funcion alternativa: which
which(data$Temperatura_Minima == min(data$Temperatura_Minima))
data[5,]

summary(data$Temperatura_Maxima)
sd(data$Temperatura_Maxima)

data$Temperatura_Maxima

summary(data$Temperatura_Minima)
sd(data$Temperatura_Minima)


# La mediana de la temperatura minima es 16.15
median(data$Temperatura_Maxima)


# Programacion basica
x = 6
if(x %% 2 == 0){
  print(paste0(x, " es par"))
} else if( x %% 3 == 0){
  print(paste0(x, " es multiplo de 3"))
}


# Nota mental, aca es feo Es horrible y feo
x = 0
suma = 0
while(suma < 100){
  print(paste0("x vale: ", x, " y la suma es ", suma))
  x = x + 1
  suma = suma + x
  if(suma >= 100){
    print(paste0("La suma es mayor o igual a 100 en ", x, " con un total de ", suma))
  }
}

x = 1:10
for(i in x){
  print(i)
}

x = matrix(1:20, ncol=4)
for(i in 1:nrow(x)){
  for(j in 1:ncol(x)){
    print(paste0(x[i,j], " esta en la coordenada ",i, ",",j))
  }
}

x = c(-2, -1, 1, 2)
ifelse(x > 0, "Positivo", "Negativo")

# Funciones

f1 = function(){
  print("Hola mundo")
}

f1()

f2 = function(x){
  suma = sum(x)
  return(suma) # Retornar con parentesis
}

f2(1:10)

f3 = function(x){
  transpuesta = t(x)
  inversa = solve(x)
  list(tr=transpuesta, inv=inversa)
  
}

x = matrix(c(1, 3, 2, 5), ncol=2)
resultados = f3(x)
resultados$tr
resultados$inv

seq(from=a, to=b, by=d)
rep(x, n)
sort(x)
rev(x)


seq(from=1, to=100, by=5) # Secuencia de 1 hasta el 100 cada 5 unidades
seq(from=0, to=100, by=5) # Secuencia de 0 hasta el 100 cada 5 unidades
v1 = rep(1:10, times=3); v1
sort(v1) # Ordeno de menor a mayor

?sort
sort(v1, decreasing = T)
v1

rev(v1) # Al reves
v1 = 1:10
v2 = 11:10
v3 = 21:30
v1; v2; v3

pmin(v1, v2, v3) # Explotan si son de dif largo
?pmin

pmax(v1, v2, v3)


sapply(1:1000/1000, round) # sapply(x, Fun)
X = matrix(1:30, ncol=3, nrow=10); X
apply(X=X, 2, mean) # apply(matriz, margin, fun), aplica la fun para cada columna


edad = 30:39; edad
genero = rep(c("F", "M", "NB"), 10); genero
tapply(edad, genero, mean)

tapply()




















