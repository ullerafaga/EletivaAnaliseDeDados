# script do professor ####
# Conversão para data
(str(minhaData1 <- as.Date(c("2015-10-19 10:15", "2009-12-07 19:15")) ) )
# Conversão é robusta até com lixo no dado
(str(minhaData2 <- as.Date(c("2015-10-19 Hello", "2009-12-07 19:15")) ) )

# Conversão para POSIXct
(str(minhaData3 <- as.POSIXct(c("2015-10-19 10:15", "2009-12-07 19:15")) ) )
unclass(minhaData3) # observamos o POSIXct no formato original (segundos)

# Conversão para POSIXlt
(str(minhaData4 <- as.POSIXlt(c("2015-10-19 10:15", "2009-12-07 19:15")) ) )
unclass(minhaData4) # observamos o POSIXlt no formato original (componentes de tempo)

### Extrações de Componentes
library(lubridate)

year(minhaData4) # ano

month(minhaData4) # mês

month(minhaData4, label = T) # mês pelo nome usando label = T

wday(minhaData4, label = T, abbr = T) # dia da semana abreviado

isoweek(minhaData4) # semana ISO 8601

epiweek(minhaData4) # semana epidemiológica

### Operações

(minhaSequencia <- seq(as.Date('2009-12-07 19:15'), as.Date('2015-10-19 10:15'), by = "day") ) # sequência usando a ideia de intervalo e de período

minhaData4 + minutes(90) # período

minhaData4 + dminutes(90) # duração

meuIntervalo <- as.interval(minhaData4[2], minhaData4[1]) # transforma em intervalo

now() %within% meuIntervalo  # investiga se está dentro do intervalo
table( (minhaSequencia + years(1) ) %within% meuIntervalo ) # observa se a frequência de casos da sequência 1 ano na frente que estão dentro do intervalo

# resolucao do exercício ####
# Criem um objeto próprio de data e tempo, convertam pros três formatos de data e tempo, e façam pelo menos 3 extrações de componentes e/ou operações.

# Conversão para data
(str(minhaData1_exercicio <- as.Date(c("1994-09-29 09:00", "1991-08-08 14:30")) ) )

# Conversão para POSIXct
(str(minhaData2_exercicio <- as.POSIXct(minhaData1_exercicio)))
unclass(minhaData2_exercicio) # observamos o POSIXct no formato original (segundos)

# Conversão para POSIXlt
(str(minhaData3_exercicio <- as.POSIXlt(minhaData1_exercicio)))
unclass(minhaData3_exercicio) # observamos o POSIXlt no formato original (componentes de tempo)

### Extrações de Componentes

year(minhaData3_exercicio) # ano

month(minhaData3_exercicio) # mês

month(minhaData3_exercicio, label = T) # mês pelo nome usando label = T

wday(minhaData3_exercicio, label = T, abbr = T) # dia da semana abreviado

isoweek(minhaData3_exercicio) # semana ISO 8601

epiweek(minhaData3_exercicio) # semana epidemiológica

