(choose(4, 4) * choose(8, 2) + choose(4, 3) * choose(8, 3) + choose(4, 2) * choose(2, 2) * choose(6, 2)) / choose(12, 6)


library(rio)
data = import(file.choose(), dec=",")

auc = c()
for(i in 1:length(data)){
  if(data[i][Mes] == "September")
}



