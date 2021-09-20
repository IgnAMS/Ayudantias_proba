(choose(4, 4) * choose(8, 2) + choose(4, 3) * choose(8, 3) + choose(4, 2) * choose(2, 2) * choose(6, 2)) / choose(12, 6)


library(rio)
data = import(file.choose(), dec=",")
data[0][Mes]
data[1]["Mes"]
data[1, 3] == 12
data[1, 4] == "Pudahuel"

sum = 0
elements = 0
for(i in 1:length(data$Energia)){
  if(data[i, 3] == 9 && data[i, 4] == "Maipú"){
    sum = sum + data[i, 2]
    elements = elements + 1
  }
}
?filter
install.packages("dplyr")
library(dplyr)
?dplyr::filter

x = dplyr::filter(data, Mes == 9 & Comuna == "Maipú")
median(x$Energia)
xp = qexp(0.45, rate = log(2) / median(x$Energia)) # Teorico
xp
quantile(x$Energia, prob = 0.45) # Real
quantile(x$Energia, prob = 0.45) / xp


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

mean(aux)










