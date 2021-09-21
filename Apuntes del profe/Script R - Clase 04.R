################################
## EYP1113-2,6 Script Clase 4 ##
################################

## Creamos el objeto Dado
Dado = 1:6

## Creamos un vector vación que iremos rellenando en cada iteración
aux = c()

## Repetimos el experimento m veces
m = 1000000
for(i in 1:m){
  x = sample(Dado, 4, replace = T) ## Lanzamiento del dado 
  aux[i] = sum(table(x)>=2)==1           ## Chequeamos si hay mayoría (TRUE si es así)
## Expliación:
## table(x) >= 2        : cuenta y chequea si al menos se observa un par
## sum(table(x) >=2)    : contamos cuantas frecuencias son mayores o iguales a 2
## sum(table(x) >=2)==1 : descartamos el caso dos pares
}

## Frecuencia empírica
mean(aux)
## [1] 0.652558
## Resultado teórico: 846/1296 = 0.6527778
 
6 * choose(4, 3) * 5 * choose(1, 1) 
6 * choose(4, 2) * 5 * 4

(720 + 6 + 120) / 6^4

1 - (0.0037)^5
