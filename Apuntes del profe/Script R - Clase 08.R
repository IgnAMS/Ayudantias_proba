##############
## Clase 08 ##
##############

## Archivos disponible?
dir()

## Importar hoja 1 del archivo ENS.xlsx
## Utilicemos la libreria "rio"
## install.packages("rio")
Data <- rio::import("ENS.xlsx")

## Utilicemos como dato el HDL de hombres (SEXO == 1)
## via filter() de la libreria "dplyr"
## install.packages("dplyr")
X <- dplyr::filter(Data,SEXO == 1)$HDL

## Histograma de Densidad
hist(X, freq = F, ylim = c(0,0.04))
lines(density(X), col = "red", lwd = 2)


