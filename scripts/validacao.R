# instalacao dos pacotes
install.packages("validate")

# script do professor
library(data.table)
library(dplyr)
library(tidyverse)
library(validate)

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") # vetor que identifica países latino americanos

latin_america <- general_data %>% filter(location %in% latin_america_countries) # filtra casos apenas no vetor

latin_america <- latin_america %>% select(location, new_cases, new_deaths)

regras_latin_america <- validator(new_cases >= 0, new_deaths >= 0)

validacao_latin_america <- confront(latin_america, regras_latin_america)

summary(validacao_latin_america)

plot(validacao_latin_america)

# exercicio
# Compartilhe com a gente uma aplicação de validação, com criação de regras pertinentes à base de dados que você estiver utilizando.

EU_countries<-c("Austria", "Belgium", 'Bulgaria', "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden") # vetor que identifica países da união europeia

EU_covid<- general_data %>% filter(location %in% EU_countries) # filtra casos apenas no vetor

EU_covid <- EU_covid %>% select(location, new_cases, new_deaths)

regras_EU_covid <- validator(new_cases >= 0, new_deaths >= 0)

validacao_EU_covid <- confront(EU_covid, regras_EU_covid)

summary(validacao_EU_covid)

plot(validacao_EU_covid)
