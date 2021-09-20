X = c("A", "A", "A", "B", "B", "B", "C", "C", "C")
aux = c()
m = 100000
for(i in 1:m){
  x = sample(X, 3, replace = F) ## Lanzamiento del dado 
  if(is.na(table(x)["A"])){
    aux[i] = F
  }
  else{
    aux[i] = sum(table(x)["A"])==3  
  }
}
sum = 0
for(i in 1:m){
  if(aux[i] == T){
    sum = sum + 1
  }
}
sum / m

## Frecuencia empírica
mean(aux)

choose(9, 3)
3*3*3/choose(9, 3)
