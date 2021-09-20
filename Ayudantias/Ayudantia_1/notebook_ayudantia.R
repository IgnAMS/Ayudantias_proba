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


# Operaciones logicas
1 > 2
1 < 2
v1 > 2

v1 < 2 
v2 > 2

# Operadores binarios or: |, and: &
v1 < 2 | v2 > 2
v1 < 2 & v2 > 2

typos = c(15, TRUE, "Holaaaa")
min(typos)

Mat = c(c(1, 2, 3), c(4, 5, 6)) # Lol, los concatena
Mat

length(Mat)
1:10
nombres[1:2]

# Factor ordena el texto, parece quees feik
opiniones = c("Bueno", "Malo", "Neutro", "Bueno", "Malo", "Malo", "Neutro", "Neutro")
opiniones
opiniones <- factor(opiniones)
opiniones
opiniones <- factor(opiniones, levels=c("Malo", "Neutro", 'Bueno'))
opiniones


# Matrices

m = matrix(v2)
m1 <- matrix(v2, nrow=4, ncol=5, byrow=T)
m1

m1[1,]
m1[,1]
m1[1,1]
m1[c(1, 2), c(3, 4)]
m1[-1, ] # Saca fila 
m1[, -1] # Saca columna

rownames(m1) <- c("f1", "f2", "f3", "f4")
colnames(m1) <- c("c1", "c2", "c3", "c4", "c5")
m1

m1[m1>5]
m1[m1<=5]

nuevafila = c(7, 8, 9, 10, 11)
m2 = rbind(m1, nuevafila) # Agrego row, con cbind podemos agregar filas
m2



