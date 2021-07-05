#1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html

covid_PE_exercicio3 <- read.csv( curl( url = "https://dados.seplag.pe.gov.br/apps/basegeral.csv", open = "", handle = new_handle( ) ), sep = ";", encoding = "UTF-8" )
View(covid_PE_exercicio3)

#2. Corrija os NAs da coluna sintomas através de imputação randômica 
install.packages('tidyverse')
install.packages('Hmisc')
library(tidyverse)
library(Hmisc)
covid_PE_exercicio3 <- covid_PE_exercicio3 %>%
  mutate( sintomas = na_if( sintomas, "" ) ) %>%
  mutate( sintomas = impute( sintomas, "random" ) )

#3. Calcule, para cada município do Estado, o total de casos confirmados e negativos

total_casos_classe_mun_ex3 <- covid_PE_exercicio3 %>% count( municipio, classe )
total_casos_classe_mun_ex3

#4. Crie uma variável binária se o sintoma inclui tosse ou não e calcule quantos casos confirmados e negativos tiveram tosse como sintoma

covid_PE_exercicio3 <- covid_PE_exercicio3 %>% 
  mutate( sint_tosse = case_when( grepl( "TOSSE", sintomas, fixed = TRUE ) == TRUE ~ 1,
                                    grepl( "TOSSE", sintomas, fixed = TRUE ) == FALSE ~ 0 ) )

total_casos_tosse_ex3 <- covid_PE_exercicio3 %>% count( classe, inclui_tosse )
total_casos_tosse_ex3 

#5. Agrupe os dados para o Estado, estime a média móvel de 7 dias de confirmados e negativos

covid_PE_exercicio3_filt <- subset( covid_PE_exercicio3, covid_PE_exercicio3$dt_notificacao > "2021-06-25" & covid_PE_exercicio3$dt_notificacao <= "2021-07-02" )

confirmados_exercicio3 <- mean( covid_PE_exercicio3_filt$classe == "CONFIRMADO" )
confirmados_exercicio3
# 0.3707612
negativos_exercicio3 <- mean( covid_PE_exercicio3_filt$classe == "NEGATIVO" )
negativos_exercicio3
# 0.6212889
