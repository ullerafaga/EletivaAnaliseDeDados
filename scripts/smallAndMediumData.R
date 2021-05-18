# criando large data ####
# install.packages('data.table')
library(data.table)

casos= 2e7 # reduza os números antes e depois do e, caso esteja difícil de computar # mas tente manter pelo menos 1e6, para garantir o efeito se large data

# cria o data.frame com o total de casos definido acima
largeData = data.table(a=rpois(casos, 3),
                       b=rbinom(casos, 1, 0.7),
                       c=rnorm(casos),
                       d=sample(c("fogo","agua","terra","ar"), casos, replace=TRUE),
                       e=rnorm(casos),
                       f=rpois(casos, 3),
                       g=rnorm(casos)
)

object.size(largeData) # retorna o tamanho do objeto

head(largeData) # vê as primeiras linhas

write.table(largeData,"bases_originais/largeData.csv",sep=",",row.names=FALSE,quote=FALSE) # salva em disco

# versão menor

casos= 9e6 # reduza os números antes e depois do e, caso esteja difícil de computar # mas tente manter pelo menos 1e6, para garantir o efeito se large data

# cria o data.frame com o total de casos definido acima
largeData1 = data.table(a=rpois(casos, 3),
                        b=rbinom(casos, 1, 0.7),
                        c=rnorm(casos),
                        d=sample(c("fogo","agua","terra","ar"), casos, replace=TRUE),
                        e=rnorm(casos),
                        f=rpois(casos, 3)
)

object.size(largeData1) # retorna o tamanho do objeto

head(largeData1) # vê as primeiras linhas

write.table(largeData1,"bases_originais/largeData1.csv",sep=",",row.names=FALSE,quote=FALSE) # salva em disco
# script do professor #####
#install.packages('data.table')
library(data.table)

enderecoBase <- 'bases_originais/largeData.csv'

# extração direta via read.csv
system.time(extracaoLD1 <- read.csv2(enderecoBase))

# extração via amostragem com read.csv

# ler apenas as primeiras 20 linhas
amostraLD1 <- read.csv2(enderecoBase, nrows=20)  

amostraLD1Classes <- sapply(amostraLD1, class) # encontra a classe da amostra amostra

# fazemos a leitura passando as classes de antemão, a partir da amostra
system.time(extracaoLD2 <- data.frame(read.csv2("bases_originais/largeData.csv", colClasses=amostraLD1Classes) ) )  

# extração via função fread, que já faz amostragem automaticamente
system.time(extracaoLD3 <- fread(enderecoBase))

# resolução do exercicio ####

#criando um dataset de large data
largeData_exercicio = data.table(a=rpois(casos, 3),
                       b=rbinom(casos, 1, 0.7),
                       c=rnorm(casos),
                       d=sample(c("grifinoria","sonserina","lufalufa","corvinal"), casos, replace=TRUE),
                       e=rnorm(casos),
                       f=rpois(casos, 3),
                       g=rnorm(casos)
)

head(largeData_exercicio) # vê as primeiras linhas

write.table(largeData_exercicio,"bases_originais/largeData_exercicio.csv",sep=",",row.names=FALSE,quote=FALSE) # salva em disco

# extração via função fread, que já faz amostragem automaticamente
system.time(extracaoLD_exercicio <- fread("bases_originais/largeData_exercicio.csv"))

extracaoLD_exercicio

#eficiencia 
#  user  system elapsed 
#  3.593   1.423  11.821 
