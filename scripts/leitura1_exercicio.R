# script do professor ####
##########
install.packages('microbenchmark')
library(microbenchmark)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
sinistrosRecife <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds"), b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), times = 30L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'), b <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';'), times = 10L)

# exercicio ####
#Desta vez, indique uma vantagem e uma desvantagem de cada tipo de arquivo (nativo e plano com interoperabilidade) e acrescente no código uma forma adicional de exportação e de leitura, com a respectiva comparação usando a função microbenchmark. Lembre-se de compartilhar um link do github!!!

# RESPOSTA:
# A biblioteca microbenchmark avalia a otimização de cada uma das opções. Compara o retorno de cada uma. Quanto tempo demora para executar cada função. No geral o CSV tem como vantagem  interoperabilidade, enquanto o  RDS é muito mais eficiente tanto em tamanho de armazenagem quanto em tempo de execução.

# Para continuar o exercicio, salvarei a mesma base como xlsx, formato nativo do excel. Minha expectativa é de que ele seja mais pesado, além de perder em interoperabilidade.

if(require(openxlsx) == F) install.packages('openxlsx'); require(openxlsx)
write.xlsx(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.xlsx")

microbenchmark(a <- write.xlsx(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.xlsx"), b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), times = 30L)

microbenchmark(a <- read.xlsx('bases_tratadas/sinistrosRecife.xlsx'), b <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';'), times = 10L)
 