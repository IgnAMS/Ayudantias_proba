# Ayudantia lab 6
library(dplyr)
library(rio)
data = import(file.choose(), dec=",")
data$localizacion = ifelse(data$location==1, "Pomedio", ifelse(data$location == 2, "Bueno", "Alta"))
data$bano = ifelse(data$bath==0, "Estandar", "Premium")
data$cocina = ifelse(data$kitchen==0, "Estandar", "Premium")
data$calefaccion = ifelse(data$cheating==0, "No", "Si")
head(data)

aux = lapply(data, class)=="character";aux
data[, aux] = lapply(data[, aux], as.factor)
data

aux = filter(data, bano=="Premium", cocina=="Premium", localizacion=="Alta")
aux 


# slice: selecciona ciertas columnas dado un criterio
slice(data, 1:20)

# arrange: ordena las cosas segun el orden de las columnas
head(arrange(data, cocina), n = 10)
tail(arrange(data, cocina), n = 10)

head(arrange(data, cocina, bano, localizacion), n=10)
tail(arrange(data, cocina, bano, localizacion), n=10)

head(arrange(data, desc(cocina), desc(bano), localizacion), n=10)
tail(arrange(data, desc(cocina), desc(bano), localizacion), n=10)


# select: obtener un subconjunto solo con ciertas columnas
head(select(data, cocina, bano), n=10)


# rename: cambia los nombres de las columnas
head(rename(data, renta=rent), n=10) # cambia el de la derecha por el de la izquierda, weird

# distinct
distinct(select(data, localizacion)) # valores distintos de una variable
distinct(select(data, localizacion, bano))


# mutate: crea nuevas col a partir de previas
head(mutate(data, rentam2=rent/area), n=10)

# transmute: lo mismo que mutate, pero solo muestra las nuevas cols
head(transmute(data, rentam2=rent/area), n=10)

# summarise: resumens de datos de las bases de datos
summarise(data, min_renta=min(rent))
summarise(data, 
          min_renta=min(rent), 
          media_renta=mean(rent),
          max_renta=max(rent),
          sd_renta=sd(rent)
)


# sample_n: numero de filas aleatroais de la bd
# sample_frac: % de filas aleatorias
sample_n(data, size=10)
sample_frac(data,size=0.003)


# Operador Pipe (%>%): multiples operaciones de un viaje
data2 = data %>% filter(rent > 600) %>%
  sample_n(size=10) %>% arrange(desc(rent))
data2


# group_by: Agrupar con el operador pipe
# n() sirve para contar la cantidad de observaciones hay en ese grupo
resumen = data %>% group_by(bano, cocina) %>% 
  summarise(n=n(), minimo=min(rent), media=mean(rent), maximo=max(rent), sd=sd(rent))
resumen


# which: los indices de las filas de una bd que cumplen con una condicion dada
which(data$bano=="Premium" & data$cocina=="Premium" & data$localizacion=="Alta")
data[1688,]

# %in%: indica si esta en un vector, retorna bool si esta o no
head(data$localizacion %in% c("Bueno", "Alta"), n=10)
which(data$localizacion %in% c("Bueno", "Alta"))












