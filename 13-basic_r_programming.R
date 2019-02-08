##########################################################################
# Jose Cajide - @jrcajide
# Master Data Science: R Programming
##########################################################################



## Estructuras de control

# `if`,`else`,`for`,`while`,`repeat`,`break`,`next`,`return`


# if, else ----------------------------------------------------------------

# if (condicion) {
#   # haz algo
# } else {
#   # haz otra cosa
# }
# 

numeros <- 1:15

numero_aleatorio <- sample(numeros, 1)

if (numero_aleatorio <= 10) {
  print(paste(numero_aleatorio, "es menor o igual que 10"))
} else {
  print(paste(numero_aleatorio, "es mayor que 10"))
}

# EJERCICIO: 
# Repite lo mismo empleando la función: ifelse()
# Usa la ayuda para consultar los parámetros de dicha función.

# else if -----------------------------------------------------------------

if (numero_aleatorio >= 10) {
  print( paste(numero_aleatorio, "es mayor o igual que 10") )
} else if (numero_aleatorio > 5) {
  print( paste(numero_aleatorio, "es mayor o igual que 5") )
} else {
  print( paste(numero_aleatorio, "es menor que 5") )
}


# AND y OR ----------------------------------------------------------------

numero_aleatorio > 5 & numero_aleatorio < 10

numero_aleatorio > 5 | numero_aleatorio < 10


# for ---------------------------------------------------------------------

for (indice in vector) {
  # haz algo
}

# Creamos un vector:
calendario <- seq(2000, 2019 , by = 1)

for (ano in calendario){
  print(paste("El a?o es", ano))
}

ano_actual <- as.numeric(format(Sys.Date(),'%Y'))

# install.packages('lubridate')
library(lubridate)
ano_actual <- year(Sys.Date())

for (ano in calendario){
  ifelse(ano == ano_actual, print(paste("El a?o es", ano)), print(ano))
}

lapply( calendario, print)

?lapply

lapply( calendario, function(ano) ifelse(ano == ano_actual, print(paste("El a?o es", ano)), print(ano)))

# M?s limpio

busca_ano_actual <- function(ano) {
  if(ano == ano_actual) {
    resultado_2 <- paste( ano, "es el a?o actual")
  } else {
    resultado_2 <- paste( ano, "no es el a?o actual")
  }
  return(resultado_2)
}

busca_ano_actual(2000)
busca_ano_actual(2018)

sapply(calendario, busca_ano_actual)


# Ejercicio ---------------------------------------------------------------

# A?o bisiesto: Haz una funcion que compruebe si un a?o es o no es bisiesto
# https://es.wikipedia.org/wiki/A%C3%B1o_bisiesto#Algoritmo_computacional
# Un a?o es bisiesto si es divisible entre cuatro y (no es divisible entre 100 ó es divisible entre 400).

es_bisiesto <- function(year){
  if((year %% 4 == 0 & year %% 100 != 0) | year %% 400 == 0)
  {
     result <- T
  }
  else
  {
    result <- F
  }
  
  return(result) 
}


es_bisiesto(2300)
`%%` #Division de enteros

# Funcion:

# Aplica a todos los a?os del calendario la funcion anterior para comprobar cuales son a?os bisiestos
lapply(calendario, es_bisiesto)

# Guarda los a?os bisiestos en un vector

calendario[sapply(calendario, es_bisiesto)]
get




