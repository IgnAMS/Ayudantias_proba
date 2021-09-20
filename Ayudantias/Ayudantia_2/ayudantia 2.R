#############################################
#############################################
#             Ayudantia 2                   #
#############################################
#############################################

rm(list=ls()) # Borra todos los objetos del global envioronment
getwd() # Me da la direccion actual
# setwd("C:/Users/iamsm/Documents/Acceso UC/Proba/Ayudantias_proba_R")  te cambia la direccion de trabajo

mtcars # Set de datos que viene con R
View(mtcars) # Se ve choro
head(mtcars)

iris # Otro sets de datos
View(iris)
str(iris)
summary(iris)

Tipo = c("I1", "I2", "Ex")
Nota = c(6.3, 1.5, 5.2)
Azul = c(T, F, T)

Libreta = data.frame(Tipo, Nota, Azul)
Libreta 
summary(Libreta)

Libreta2 = data.frame(Tipo2=Tipo, Nota2=Nota, Azul2=Azul)
Libreta2

Libreta[c(1,3), c("Azul", "Nota")] # Columnas azul y notas, y filas 1 y 3
Libreta
Libreta$Nota # Vector
Libreta["Nota"] # Sub data frame
Libreta[2] # Sub data frame

subset(Libreta, subset= Nota > 5) # Crea un sub set
subset(Libreta, subset= Azul == T) # Crea un sub set

Libreta[Libreta$Azul == T, ] # Sub set, la coma te permite iterar
Libreta[Libreta$Azul == T & Libreta$Nota>6, ] # Set vacio, no se cumple
Libreta[Libreta$Azul == F & Libreta$Nota>6, ]

Libreta[order(Libreta$Nota), ] # Tomo libreta

x = c(1, 2, 3)
y = c(0, 1, 3)
z = c(3, 4, 5)

experimento = data.frame(x, y, z) # Los considera columnas
experimento

# No hacer, esto es raro y no funciona xd
experimento[, experimento$y[1] == 0]
experimento[, 0]
experimento[, experimento$x > 1]
# Fin del bloque prohibido, siga adelante

Libreta[order(Libreta$Nota), ]
Libreta[order(Libreta$Tipo), ]
nueva_fila = data.frame(Tipo="I3", Nota=4.2, Azul=T)
nuevaLibreta = rbind(Libreta, nueva_fila)
nuevaLibreta

nuevaLibreta2 = cbind(nuevaLibreta, "Copia"=c(1,1,0,0)) # Anade la columna
nuevaLibreta2

juan = c(T, F, F, F)

# Cambio de nombers
colnames(nuevaLibreta2) = c("Tipo2", "Nota2", "Azul2", "Copia2")
colnames(nuevaLibreta2)[4] = "Copia3"
# rownames() hace lo mismo
nuevaLibreta2

opiniones = c("Buena", "Mala", "Mala", "Buena", "Muy Mala")
opiniones = as.factor(opiniones)
opiniones
m1 = matrix(1:10, nrow=5)
opiniones
m1

lista = list(opiniones, m1, nuevaLibreta2)
lista

lista2 = list(v=opiniones, m=m1, bd=nuevaLibreta2)

lista[1]
lista[2]
lista[3]

lista2$v
lista2$m
lista2$bd




getwd()
setwd("C:/Users/iamsm/Documents/Acceso UC/Proba/Ayudantias_proba_R/Ayudantia_2") # Ingreso a la carpeta de trabajo
data = import(file.choose()) # Usar la libreria rio
data = import("Tenis.txt") # Otra opcion desde la carpeta
data







