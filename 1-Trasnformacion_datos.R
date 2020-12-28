library(dplyr)
library(readr)

data_org <- read_delim("C:/Users/User/Desktop/20201124-test-convocatoria/01. transformacion_datos/data_org.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)
library(readr)
data_fnl <- read_csv("C:/Users/User/Desktop/20201124-test-convocatoria/01. transformacion_datos/data_fnl.csv")


datos <- data_org

## 1. renombrar los nombres de las columnas 

names(datos)[1]="FechaContable"
names(datos)[2]="FechaTransaccion"
names(datos)[3]="HoraTransaccion"
names(datos)[4]="Empresa"
names(datos)[5]="RutaSae"
names(datos)[6]="Linea"
names(datos)[7]="StrParadero"
names(datos)[8]="TipoVehiculo"
names(datos)[9]="Bus"
names(datos)[10]="TipoValidacion"
names(datos)[11]="StrLinea"

## 2. Crear o eliminar columnas de acuerdo con el dataset final 


   #Creamos las columnas Paradero, StrRutaSae y Cenefa con valores en 0 para mas adelante poder ocuparlos
datos$Paradero <- 0
datos$StrRutaSae <- NA
datos$Cenefa <- substr(datos$StrParadero, start = 2, stop = 6)

   # Eliminamos la columa "TipoVehículo"

borrar <- c("TipoVehiculo")
datos <- datos[ , !(names(datos) %in% borrar)]

## 3. Convertir las columnas de fecha en formato "%Y-%m-%d"

datos$FechaContable <- format(as.Date(datos$FechaContable ,format="%m/%d/%Y"),"%Y-%m-%d")
datos$FechaContable <- as.Date(datos$FechaContable,format = "%Y-%m-%d")

datos$FechaTransaccion <- format(as.Date(datos$FechaTransaccion ,format="%m/%d/%Y"),"%Y-%m-%d")
datos$FechaTransaccion <- as.Date(datos$FechaTransaccion,format = "%Y-%m-%d")

class(datos$FechaTransaccion)
class(datos$FechaContable)


## 4. De la columna 'SrtParadero' obtener solo los dígitos 

nchar(datos$StrParadero)
datos$Paradero <- substr(datos$StrParadero, start = 2, stop = 6)


## 5. De la columna 'SrtLinea' obtener solo el texto

nchar(datos$StrLinea)
datos$Paradero <- substr(datos$StrParadero, start = 2, stop = 6)


