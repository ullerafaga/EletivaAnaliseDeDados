# Script do Professor ####
sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

# carrega a base de snistros de transito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

# junta as bases de dados com comando rbind (juntas por linhas)

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# modifica natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# cria funçaõ para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

# Instrução da atividade ####
#Desta vez, queremos que você mostre que entendeu o processo de ETL modificando 
#um pouco a extração e o tratamento. Ou seja: adicione mais ano de acidentes de
#trânsito à extração e lembre-se de uni-lo aos demais com o rbind; depois, 
#busque mais uma coluna para transformar em fator e acrescente isso ao código. 
#Lembre-se de compartilhar um link do github!!!

# Resolução do Exercício ####
# baixando mais uma base de dados, a do ano 2018
sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv', sep = ';', encoding = 'UTF-8')

View(sinistrosRecife2018Raw)
View(sinistrosRecife2019Raw)
View(sinistrosRecife2020Raw)
View(sinistrosRecife2021Raw)

# ambas 2019 e 2018 tinham colunas que não temos nas de 2020 e 2021, então foram
#retiradas
sinistrosRecife2018Mod <- sinistrosRecife2018Raw[, -(10:12)]
sinistrosRecife2019Mod <- sinistrosRecife2019Raw[, -(10:12)]

# a variável data tinha notação diferente, então também mudei

names(sinistrosRecife2019Mod)[grep('DATA', names(sinistrosRecife2019Mod))] <- 'data'

names(sinistrosRecife2018Mod)[grep('DATA', names(sinistrosRecife2018Mod))] <- 'data'

# contatenando as bases de dados
sinistrosRecife_exercicio <- rbind(sinistrosRecife2018Mod, sinistrosRecife2019Mod,sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# observa a estrutura dos dados
str(sinistrosRecife_exercicio)


# modifca a data para formato date
sinistrosRecife_exercicio$data <- as.Date(sinistrosRecife_exercicio$data, format = "%Y-%m-%d")

# modifica situação de texto para fator
sinistrosRecife_exercicio$situacao <- as.factor(sinistrosRecife_exercicio$situacao)

# cria funçaõ para substituir not available (na) por 0
# importante, estou rodando para fins didáticos, mas a função já existia 
# do script do professor e não precisava mudar
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecife_exercicio[, 15:25] <- sapply(sinistrosRecife_exercicio[, 15:25], naZero)

# exporta em formato nativo do R
saveRDS(sinistrosRecife_exercicio, "bases_tratadas/sinistrosRecife_exercicio.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeR_exercicio, "bases_tratadas/sinistrosRecife_exercicio.csv")
