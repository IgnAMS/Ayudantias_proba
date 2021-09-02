#############################################
#############################################
#             Ayudantia 1                   #
#############################################
#############################################

print("hola mundo")
# Asignación de datos
a <- 3*6+9/7
a

# Para eliminar un dato 
rm(a)

h <- "holaaa"
h

# Vectores, la flecha es innecesaria
numeros = c(1, 2, 3, 4, 5, 6)
numeros

booleanos = c(T, F, TRUE, FALSE)
booleanos

notas = c(3, 4, 5, 6)
nombres = c("I1", "I2", "I3", "Ex")
names(notas) <- nombres
notas

notas["I1"]


# Operaciones entre vectores
v1 = c(1, 2, 3, 4, 5)
v2 = c(1, 3, 4, 5, 1)
v1 + v2
v1 / 2

sum(v1)
prod(v1)
mean(v1)
sd(v1) # Standard deviation


