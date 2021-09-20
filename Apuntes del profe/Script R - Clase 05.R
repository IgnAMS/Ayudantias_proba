###########################
## EYP1113-2,6: Clase 05 ##
###########################

## Combinatoria(n,r) = choose(n,r)
## Permutación(n,r) = n!/(n-r)! = factorial(n)/factorial(n-r)

## I1-2020-02-P4: Problema Pila

## Experimento correspone a selecionar una muestra de tamaño 6
S = choose(12,6)
S
## Vamos a contar en cuantos de estos casos tenemos al menos 1/2 carga.
A = choose(4,4)*choose(8,2)+choose(4,3)*choose(8,3)+choose(4,2)*choose(2,2)*choose(6,2)
A
A/S

## Realicemos este mismo experimento de manera empírica
Pilas = c("V","V","V","V","A","A","R","R","R","R","R","R")
A = c()
for(i in 1:1000000){
muestra = sample(Pilas, 6, replace = F)
A[i] = (sum(muestra == "V")*1+sum(muestra == "A")*0.5+sum(muestra == "R")*0)>=3
}
## Casos Favorables
sum(A)
## Frecuencia Empirica
mean(A) 



