library(rio)
# install.packages("rio")
# install.packages("modeest")
data = import(file.choose(), dec=",")

IQR(data$PRECIO, na.rm = T)
length(data$PRECIO)

median(data$PRECIO)
coef_var = function(x, na.rm = F){
  sd(x, na.rm=na.rm) / mean(x, na.rm = F)
}
coef_var(data$PRECIO)
mean(data$PRECIO)
max(table(data$PRECIO)) # La moda es 1303
table[, table(data$PRECIO) == max(table(data$PRECIO))]
quantile(data$PRECIO, prob=seq(0, 1, length = 101)) # Usar n 
hist(
  data$NUBOSIDAD, breaks=5, probability = F,
  main="Histograma de Densidad", xlab = "Porcentaje de Nubosidad", border = "white", col = "gray"
)

R.version
### CORRECCION
library(modeest)
X = c(tapply(X = data$PRECIO, INDEX = list(data$MES, data$AÑO), mean))
X = c(tapply(X = data$PRECIO, INDEX = list(data$MES+100, data$AÑO), mean))
X = aggregate(PRECIO ~ MES * AÑO, data = data, FUN = mean)$PRECIO
Tabla = round(rbind(
  IQR(X, na.rm = T), 
  median(X, na.rm = T), 
  sd(X, na.rm = T) / mean(X, na.rm = T), 
  modeest::mlv(X, na.rm = T),
  quantile(X, prob = 0.65, na.rm = T)), 
  2
)
X

rownames(Tabla) = c("IQR", "Mediana", "c.o.v.", "Moda", "Percentil %65")
colnames(Tabla) = "PRECIO"
Tabla


IQR(X, na.rm = T)
median(X, na.rm = T)

hist(data$NUBOSIDAD, breaks = 5, las = 1) # las permite que esten derechas las cosas
hist(data$NUBOSIDAD, breaks = 5, freq = F) # Freq = F hace que sea un grafico de densidad
hist(
  data$NUBOSIDAD, breaks = 5, las = 1, freq = F, main = "Histograma de Densidad"
)
hist(
  data$NUBOSIDAD, breaks = 5, las = 1, freq = F, main = "Histograma de Densidad",
  font.main = 1, border = "white", xlab = "Porcentaje de Nubosidad"
)



?hist
