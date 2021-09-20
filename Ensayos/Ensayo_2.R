X = c("A", "A", "A", "B", "B", "B", "C", "C", "C")
aux = c()
m = 1000000
for(i in 1:m){
  x = sample(X, 3, replace = F) ## Lanzamiento del dado 
  aux[i] = (x[1] != x[2] && x[1] != x[3])
}

x = sample(X, 3, replace = F)
x
x[1] != x[2] && x[1] != x[3]

## Frecuencia empírica
mean(aux)

choose(9, 3)
3*3*3/choose(9, 3)
