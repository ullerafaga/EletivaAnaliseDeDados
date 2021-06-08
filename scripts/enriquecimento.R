# script do professor ####
library(dplyr)
library(tidyverse)

baseCodMun <- read.table('bases_originais/base_codigos_mun.txt', sep = ',', header = T, encoding = 'UTF-8')

campusIES <- read.csv2('bases_originais/ies_georref.csv')

campusIES <- left_join(campusIES, baseCodMun, by = c('CO_MUNICIPIO' = 'id_munic_7'))

# exercicio
# Compartilhe com a gente uma aplicação de enriquecimento usando join em outra dupla de bases.

state.abbdf <- as.data.frame(state.abb)
index_state_db <- seq(length(state.abbdf), 50)
state.abbdf <- cbind(state.abbdf, index_state_db)
state.abbdf

state.areadf <- as.data.frame(state.area)
state.areadf <- cbind(state.areadf, index_state_db)

states_db <- left_join(state.abbdf, state.areadf, by = "index_state_db")
states_db
