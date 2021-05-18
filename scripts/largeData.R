# script do professor ####
install.packages('ff')
library(ff)
install.packages('ffbase')
library(ffbase)
enderecoBase <- 'bases_originais/largeData.csv'
# criando o arquivo ff
system.time(extracaoLD4 <- read.csv.ffdf(file=enderecoBase))
class(extracaoLD4) # veja a classe do objeto

object.size(extracaoLD3) # a vantagem está no tamanho!
object.size(extracaoLD4) # a vantagem está no tamanho!
sum(extracaoLD4[,3]) # algumas operações são possíveis diretamente
#lm(c ~ ., extracaoLD4) ## não vai rodar!!!! o vetor de computação será mt grande
# pra outras, será preciso amostrar...
extracaoLD4Amostra <- extracaoLD4[sample(nrow(extracaoLD4), 100000) , ]

lm(c ~ ., extracaoLD4Amostra) # aí, funciona!!!

system.time(extracaoLD5 <- read.csv.ffdf(file='bases_originais/Activity recognition exp/Phones_accelerometer.csv'))
system.time(extracaoLD5 <- read.csv.ffdf(file='bases_originais/Phones_accelerometer.csv'))

system.time(extracaoLD6 <- read.csv.ffdf(file='bases_originais/Activity recognition exp/Phones_gyroscope.csv'))
length(extracaoLD5$Model)

extracaoMerge <- ffdfrbind.fill(extracaoLD5, extracaoLD6) # junta bases semelhantes forçando preenchimento
system.time(extracaoLD6 <- read.csv.ffdf(file='bases_originais/Phones_gyroscope.csv'))

length(extracaoLD6$Model)

extracaoMerge <- ffdfappend(extracaoLD5, extracaoLD6) # junta bases semelhantes

#extracaoMerge <- ffdfrbind.fill(extracaoLD5, extracaoLD6) # junta bases semelhantes forçando preenchimento

length(extracaoMerge$Model)

# resolucao do exercicio ####
#Compartilhe com a gente um código criado por você em que um large data é lido através da função ff. Também mostre pelo menos duas operações estatísticas (média, mediana...) ou matemáticas básicas (soma, produto...), e uma aplicação de estatística inferencial (regressão linear, X²...), usando uma amostra da base.

system.time(extracaoLD_exercicio2 <- read.csv.ffdf(file="bases_originais/largeData_exercicio.csv"))
class(extracaoLD_exercicio2)
extracaoLD_exercicio2

sum(extracaoLD_exercicio2[,7])
mean(extracaoLD_exercicio2)

extracaoLD_exercicio2amostra <- extracaoLD_exercicio2[sample(nrow(extracaoLD4), 100000) , ]

lm(c ~ ., extracaoLD_exercicio2amostra)
