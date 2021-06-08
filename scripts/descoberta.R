# instalando os pacotes ####
install.packages('funModeling')
install.packages('tidyverse')

# script do professor ####
library(funModeling) 
library(tidyverse) 

glimpse(iris) # olhada nos dados
status(iris) # estrutura dos dados (missing etc)
freq(iris) # frequência das variáveis fator
plot_num(iris) # exploração das variáveis numéricas
profiling_num(iris) # estatísticas das variáveis numéricas

#  exercicio ####
# Compartilhe com a gente um código em que você implementa EDA sobre uma base diferentes daquela do exercício.

glimpse(quakes)
status(quakes)
freq(quakes) #não tem nenhuma
plot_num(quakes)
profiling_num(quakes)

