#################################
#         Torpedo i1 proba      #
#################################



##########################################################
#                         Combinatorias                  #
##########################################################
choose() # Combinatoria
factorial() # Factorial


##########################################################
#  Simular (se demora como 8 minutos, poco recomendable) #
##########################################################
X = c("A", "A", "A", "A", "B", "B", "C", "C", "C", "C", "C", "C")
aux = c()
m = 1000000
for(i in 1:m){ # 7 minutos
  x = sample(X, 6, replace = F) ## Lanzamiento del dado 
  if(is.na(table(x)["A"])){
    aux[i] = F
  }
  else if(is.na(table(x)["B"])){ # A no es NA
    aux[i] = table(x)["A"] >= 3
  }
  else{ # Ninguno es NA 
    aux[i] = (table(x)["A"] >= 3 || (table(x)["A"] == 2 && table(x)["B"] == 2))
  }
}

##########################################################
#                 Bases de datos                         #
##########################################################

x = dplyr::filter(data, Mes == 9 & Comuna == "Maipú") # base de datos, restricciones

# Lambdas approaches
# mean(X) = E(X) = 1/lambda
# median(X) = x50 = log(2)/lambda
# sd(X) = sqrt(Var(X)) = 1/lambda
qexp(0.45, rate = lambda) # Percentil teorico
quantile(x$Energia, prob = 0.45) # Percentil empirico


library(rio)
data = import(file.choose(), dec=",")

library(modeest)
# tapply permite tomar un vector, en el list se coloca los separadores y luego la funcion 
# Se puede elegir uno de los 3 metodos
X = c(tapply(X = data$PRECIO, INDEX = list(data$MES, data$AÑO), mean))  # Usar este xd, mas facil
X = c(tapply(X = data$PRECIO, INDEX = list(data$MES+100, data$AÑO), mean)) 
X = aggregate(PRECIO ~ MES * AÑO, data = data, FUN = mean)$PRECIO 

Tabla = round(rbind( # Datos utiles
  IQR(X, na.rm = T),  # IQR de los datos
  median(X, na.rm = T),  # Mediana de los datos
  sd(X, na.rm = T) / mean(X, na.rm = T),   # desviacion estandar de los datos
  modeest::mlv(X, na.rm = T), # Moda de los datos
  quantile(X, prob = 0.65, na.rm = T)),  # Cuantil de los datos
  2
)
Tabla












