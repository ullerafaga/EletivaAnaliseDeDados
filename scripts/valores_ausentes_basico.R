# instalação dos pacotes ####
install.packages('data.table')
install.packages('funModeling')
install.packages('tidyverse')
install.packages('VIM')

# script do professor ####
library(data.table)
library(funModeling) 
library(tidyverse) 

idade <- c(floor(runif(70, 0, 80)), NA, NA)
mean(idade)
mean(idade, na.rm = TRUE)

covid19PE <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')

## identificando e removendo valores ausentes
status(covid19PE) # estrutura dos dados (missing etc)

# Complete-case analysis – listwise deletion
dim(covid19PECompleto <- na.omit(covid19PE)) # deixa apenas os casos completos, mas vale a pena?

# Variação de Complete-case analysis – listwise deletion
dim(covid19PECompleto <- covid19PE %>% filter(!is.na(faixa_etaria)))

## estimando se o NA é MCAR, MAR ou MANR
## Shadow Matrix do livro R in Action

library(VIM)
data(sleep, package = "VIM") # importa a base sleep

head(sleep) # observa a base

x <- as.data.frame(abs(is.na(sleep))) # cria a matrix sombra
head(x) # observa a matriz sombra

y <- x[which(sapply(x, sd) > 0)] # mantém apenas variáveis que possuem NA
cor(y) # observa a correlação entre variáveis

cor(sleep, y, use="pairwise.complete.obs") # busca padrões entre os valores específicos das variáveis e os NA

## Shadow Matrix da nossa base de covid19 com adaptações

covid19PENA <- as.data.frame(abs(is.na(covid19PE))) # cria a matriz sombra da base de covid19

covid19PENA <- covid19PENA[which(sapply(covid19PENA, sd) > 0)] # mantém variáveis com NA
round(cor(covid19PENA), 3) # calcula correlações

# modificação já que não temos uma base numérica
covid19PENA <- cbind(covid19PENA, municipio = covid19PE$municipio) # trazemos uma variável de interesse (municípios) de volta pro frame
covid19PENAMun <- covid19PENA %>% group_by(municipio) %>% summarise(across(everything(), list(sum))) # sumarizamos e observamos se os NA se concentram nos municípios com mais casos

# resolução do exercício ####
#Compartilhe com a gente um código criado por você com uma shadow matrix e um teste de aleatoriedade de valores ausentes. Lembre-se de compartilhar um link do github!!!

bd_ex_valoresAusentes <- fread("http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/db610fdc-18fa-41a1-9b26-72038c56ffc8/download/acidentes-transito-2015.csv")

#install.packages('bit64')
#library(bit64)

head(bd_ex_valoresAusentes) # observa a base

x <- as.data.frame(abs(is.na(bd_ex_valoresAusentes))) # cria a matrix sombra
head(x) # observa a matriz sombra

y <- x[which(sapply(x, sd) > 0)] # mantém apenas variáveis que possuem NA
cor(y) # observa a correlação entre variáveis

#A correlação é baixissima em todas as comparações, indicando aleatoriedade
