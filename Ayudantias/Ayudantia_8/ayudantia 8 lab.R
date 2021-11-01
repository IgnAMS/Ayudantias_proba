################
#     Lab 8    #
################

# gather --------------

set.seed(1113)
df = data.frame(
  ID=1:10, Tipo1=rep(c("A", "B"), by=5),
  Tipo2=rep(c("C", "D"), each=5),
  var1=rnorm(10), var2=rnorm(10), var3=rnorm(10)
)
df

library(tidyr)

# Gather la transpone
df2 = gather(data=df, key="Col", value="Valor", var1:var3)
df2


# spread: de larga a ancha
df3 = spread(df2, key=Col, value=Valor)
df3 

# Separate: sirve para separar una columna en varias que tengan el mismo delimitador
df4 = data.frame(Col1=c("1-a", "2-b", "3-c", "4-d"))
df4
df5 = separate(data=df4, col=Col1, into=c("numero", "letra")) # Reconoce el '-' como delimitador
df5
df5 = separate(data=df4, col=Col1, into=c("numero", "letra"), sep="-")
df5

# Unite
df6 = unite(data=df5, col=Col1, numero:letra, sep="-")
df6

# ggplot2 
library(ggplot2)
data = mpg

p1 = ggplot(
  data=data, 
  aes(x=hwy)
)
p1 + geom_histogram()

p2 = p1 + geom_histogram(
        binwidth = 2.6, col="white", fill="steelblue",
        alpha=0.5
      )
p2

p3 = p2 + labs(x="Millas por galon", y="Frecuencia")
p3
p4 = p3 + ggtitle("Histograma de millas por galon en la carretera", subtitle = "Base de datos: mpgcars")
p4

p5 = p1 + geom_histogram(
            aes(y=..density..),
            binwidth=2.5, col="white", fill="steelblue",
            alpha=0.5
          ) + labs(
            x="millas por galon en la carretera",
            y="Densidad"
          ) + ggtitle(
            "Histograma de millas por galon en la carretera",
            subtitle = "Base de datos: mpgcars"
          )
p5

# Guardar donde se trabaja
# ggsave("geomhisogram.png")

# Segun fraccion
p5 + facet_grid(rows="drv")
p5 + facet_wrap(facets="drv")

p1 = ggplot(data=data, aes(x=hwy, fill=drv))

# Le saco el fill del geom_histogram()
p2 = p1 + geom_histogram(
        aes(y=..density..),
        binwidth=2.5, col="white",
        alpha=0.5
      ) + labs(
        x="millas por galon en la carretera",
        y="Densidad"
      ) + ggtitle(
        "Histograma de millas por galon en la carretera",
        subtitle = "Base de datos: mpgcars"
      )
p2


# geom_point() -------------
p1 = ggplot(data=data, aes(x=hwy, y=cty))
p1 + geom_point()

p2 = p1 + geom_point(
    size=5, alpha=0.5, col="steelblue", shape=18
  ) + labs(
    x="Millas por galon en la carretera",
    y="Millas por galon en la ciudad"
  ) + ggtitle("Grafico de dispersion de hwy vs cty", subtitle="Base de datos: mpg")
p2
 


p3 = p1 + geom_point(aes(col=drv, shape=drv), size=5, alpha=0.5)+
  labs(
    x="Millas por galon en la carretera",
    y="Millas por galon en la ciudad"
  )+
  ggtitle("Grafico de dispersion de hwy vs cty", subtitle="Base de datos: mpg")
p3

library(dplyr)
data2 = data%>% sample_n(size=20)
p1 = ggplot(data=data2, aes(x=hwy, y=cty, label=drv))+
  labs(
    x="Millas por galon en la carretera",
    y="Millas por galon en la ciudad"
  ) + ggtitle("Grafico de dispersion de hwy vs cty", subtitle="Base de datos: mpg")

# numero 
p1 + geom_point() + geom_text(vjust=-1)

# etiqueta
p1 + geom_point() + geom_label(vjust=-1)

p1 = ggplot(data=data, aes(x=class))
p1 + geom_bar()
p1 + geom_bar(col="white", fill="steelblue")

p1 = ggplot(data=data, aes(x=class, fill=drv))
paleta = c("#E15085", "#42A7DB", "#F3A732")
p1 + geom_bar() + scale_fill_manual(values=paleta) + theme_minimal()


# Grafico de lado
p1 + geom_bar(position="dodge")+ scale_fill_manual(values=paleta) + theme_minimal()
p1 + geom_bar(position="fill")+ scale_fill_manual(values=paleta) + theme_minimal()


# Grafico de lado
p1 + geom_bar() + scale_fill_manual(values=paleta) + 
  theme_minimal() + coord_flip()

# Grafico de torta
ggplot(data=data, aes(x="", fill=drv)) + geom_bar() + scale_fill_manual(values=paleta) + 
  theme_minimal() + coord_polar("y", start=0)


# Boxplot ---------------
p1 = ggplot(data=data, aes(x=hwy))
p2 = p1 + geom_boxplot()
p2
p2 + coord_flip()


p3 = ggplot(data=data, aes(x=hwy, y=drv))

p4 = p3 + geom_boxplot(aes(fill=drv)) + coord_flip() + scale_fill_manual(values=paleta)+
  theme_minimal()
p4




















