library(rio)
data = import(file.choose(), dec=",")
head(data)

data$localizacion = ifelse(
                      data$location == 1, "Promedio",
                      ifelse(data$location == 2, 
                             "Bueno", 
                             "Alta"
                      )
                    )

data$bano = ifelse(data$bath == 0, "Estandar", "Premium")
data$cocina = ifelse(data$kitchen == 0, "Estandar", "Premium")
data$calefaccion = ifelse(data$cheating == 0, "No", "Si")
str(data)


# Convirtiendo los char a factor
aux = lapply(data, class) == "character"
data[,aux] = lapply(data[,aux], as.factor)
data[,aux]


# plots -------------------------------------------------------------------
plot(x=data$rent, y=data$rentsqm)
points(x=1500, y=14)
lines(x=c(1000,1500), y=c(5,15))
abline(h=15)
abline(v=100)
abline(a=5, b=10/100)

plot(x=data$rent, y=data$rentsqm, type="n")
points(x=c(1500, 14), y=c(155, 11)) 

colors() # colores

plot(
  x=data$rent, y = data$rentsqm, xlab="Renta", ylab="Renta por metro cuadrado",
  main="Renta versus renta por metro cuadrado", col="darkblue", lwd=1
)
points(x=1500, y= 15, col="darkred", lwd=2)
text(x=1500, y=16, label="Etiqueta del punto")



# Simbolos matematicos y funciones
par(mar=c(5.1, 5.1, 4.1, 2.1))
curve(
  expr=100 * (x^3 - x^2)+15, from=0, to=1, 
  xlab=expression(alpha), ylab=expression(100%*%(alpha^3 - alpha^2)+15),
  main=expression(paste("Funcion: ", f(alpha)==100%*%(alpha^3 - alpha^2)+15))
)
sigma1 = 1.2
# bquote me permite usar valores de variables
# los corchetes hacen referencia a un sub
text(0.1, 3, bquote(sigma[alpha]==.(sigma1))) # el punto le asigna el valor de la var
text(0.8, 11, expression(sigma[alpha]==0.25))


# Box plot separa por cuartiles, minimo y maximo
# Vertical
boxplot(
  x=data$rent, main="Boxplot de renta", xlab="", ylab="Renta", horizontal=F,
  col="pink"
)
# Horizontal
boxplot(
  x=data$rent, main="Boxplot de renta", xlab="", ylab="Renta", horizontal=T,
  col="pink"
)
# Respecto a la localizacion
boxplot(
  data$rent~data$localizacion, main="Boxplot de renta", 
  xlab="Localizacion", ylab="Renta", horizontal=F, col="pink"
)



# histograms -------------------------------------------------------------
hist(
  x=data$rent, main="Histograma de renta", freq=T, xlab="Renta", ylab="Frecuencia",
  col="yellow"
)

# Ahora es la densidad, no la frecuencia
hist(
  x=data$rent, main="Histograma de renta", freq=F, xlab="Renta", ylab="Densidad",
  col="yellow"
)

# De 10 quiebres
hist(
  x=data$rent, main="Histograma de renta", freq=F, xlab="Renta", ylab="Densidad",
  col="yellow", breaks=10
)



# Barplot -----------------------------------------------------------------

table(data$localizacion)
barplot(height=table(data$localizacion), col="darkgreen")
barplot(height=table(data$localizacion), col="darkgreen", horiz=T)

# Tabla de doble entrada
table(data$localizacion, data$bano)

# beside=T hace que sean agrupados, F los hace apilado
barplot(
  height=table(data$localizacion, data$bano), 
  col=c("tomato", "violetred", "turquoise"), beside=T, legend.text=T
)


# Ejercicios --------------------------------------------------------------




# Guardar -----------------------------------------------------------------
# pdf(file="nombre", widht=, height=)
# plot()
# dev.off()
# Es mas facil export, por lejos lo mas facil





# Modelos de proba --------------------------------------------------------

# dDISTR(x, ) -> distribucion de P(X=x) o fx(x)
# pDISTR(q, ) -> P(X<=x)
# qDISTR(p, ) -> x tq P(X<=x) = p
# rDISTR(n, ) -> genera una muestra del modelo de distrubicion

# Exponencial
dexp(x, rate=v) # densida
pexp(q, rate=v) # Probabilidad de que sea P(X<=q)
qexp(qm rate=v) # Da el x que ...
rexp(n, rate=v) # genera n variables

dexp(1, rate=3)
pexp(1.5, rate=3)
qexp(0.5, rate=3)
muestra = rexp(1000, rate=3)
hist(muestra, freq=F, col="pink")
# add permite añadirlo, lty=2 lo hace punteado
curve(dexp(x, rate=3), add=T, lwd=3, col="blue", lty=2) 

dunif(0, min=-2, max=8)
punif(0, min=-2, max=8)
qunif(0.3, min=-2, max=8)
muestra = runif(1000, min=-2, max=8)
hist(muestra, freq=F, col="yellow")


