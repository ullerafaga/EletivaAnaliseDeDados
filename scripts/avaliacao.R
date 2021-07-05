# 1. Extraia a base geral de covid em Pernambuco disponÃ­vel neste endereÃ§o: https://dados.seplag.pe.gov.br/apps/corona_dados.html.

#install.packages("curl")
library(curl)
covid_PE_avaliacao <- read.csv( curl( url = "https://dados.seplag.pe.gov.br/apps/basegeral.csv", open = "", handle = new_handle( ) ), sep = ";", encoding = "UTF-8" )
View(covid_PE_avaliacao)

#2. Calcule, para cada municÃ­pio do Estado, o total de casos confirmados e o total de Ã³bitos por semana epidemiolÃ³gica [atenÃ§Ã£o, vocÃª terÃ¡ de criar uma variÃ¡vel de semana epidemiolÃ³gica com base na data].
s
# criando a variavel da semana epidemiologica
#install.packages ("lubridate")
library(lubridate)
covid_PE_avaliacao$semana_epi <- epiweek(covid_PE_avaliacao$dt_notificacao)

# calculando o total de confirmados e o total de Ã³bitos por semana epidemiolÃ³gica para cada municÃ­pio

#install.packages("tidyverse")
library(tidyverse)

covid_PE_avaliacao_confirmado <- covid_PE_avaliacao %>% count(semana_epi, municipio, classe)
covid_PE_avaliacao_confirmado <- subset(covid_PE_avaliacao_confirmado, classe == "CONFIRMADO")
View(covid_PE_avaliacao_confirmado)

covid_PE_avaliacao_obito <- covid_PE_avaliacao %>% count(semana_epi, municipio, evolucao)
covid_PE_avaliacao_obito <- subset(covid_PE_avaliacao_obito, evolucao == "OBITO")
View(covid_PE_avaliacao_obito)

#3. EnriqueÃ§a a base criada no passo 2 com a populaÃ§Ã£o de cada municÃ­pio, usando a tabela6579 do sidra ibge.

#importante, modifiquei manualmente a tabela6579 para facilitar o manuseio no R. Retirei a populacao brasileira, e substitui as duas primeiras linhas por uma linha com "municipio" e "populacao" nas duas primeiras células, respectivamente

#install.packages("readxl")
#install.packages("stringi")
#install.packages("fuzzyjoin")

library(readxl)
library(stringi)
library(fuzzyjoin)

# lendo a tabela6579

tabela6579 <- read_excel('./tabela6579.xlsx')
View(tabela6579)

tabela6579$estado <- str_sub(tabela6579$municipio, start = -4)
tabela6579 <- subset(tabela6579, estado == '(PE)')
tabela6579$estado <- NULL
tabela6579$municipio<- sti_trans_general (tabela6579$municipio, "Latin-ASCII")
tabela6579$municipio <- substr(tabela6579$municipio,1,nchar(tabela6579$municipio)-5)
View(tabela6579)

covid_PE_avaliacao <- regex_join(covid_PE_avaliacao, tabela6579, by = "municipio", ignore_case = TRUE)

#4. Calcule a incidÃªncia (casos por 100.000 habitantes) e letalidade (Ã³bitos por 100.000 habitantes) por municÃ­pio a cada semana epidemiolÃ³gica.

covid_PE_avaliacao_confirmado_pop <- regex_join(covid_PE_avaliacao_confirmado, tabela6579, by = "municipio", ignore_case = TRUE)
View(covid_PE_avaliacao_confirmado_pop)

covid_PE_avaliacao_confirmado_pop <- covid_PE_avaliacao_confirmado_pop %>% mutate( covid_PE_avaliacao_confirmado_pop = ( as.numeric( covid_PE_avaliacao_confirmado_pop$n ) * 100000 ) / as.numeric( covid_PE_avaliacao_confirmado_pop$pop ) )


covid_PE_avaliacao_obito_pop <- regex_join(covid_PE_avaliacao_obito, tabela6579, by = "municipio", ignore_case = TRUE)
View(covid_PE_avaliacao_obito_pop)


covid_PE_avaliacao_obito_pop <- covid_PE_avaliacao_obito_pop %>% mutate( covid_PE_avaliacao_obito_pop = ( as.numeric( covid_PE_avaliacao_obito_pop$n ) * 100000 ) / as.numeric( covid_PE_avaliacao_obito_pop$pop ) )

