# instalacao de pacotes ####
install.packages('plotly')
install.packages('EnvStats')

# script do professor ####
library(dplyr)
library(data.table)
library(plotly)
library(EnvStats)

# carregar dados covid19 Pernambuco
covid19PE <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')

covid19PEMun <- covid19PE %>% count(municipio, sort = T, name = 'casos') %>% mutate(casos2 = sqrt(casos), casosLog = log10(casos))

## outliers em variáveis
# distância interquartil

plot_ly(y = covid19PEMun$casos, type = "box", text = covid19PEMun$municipio, boxpoints = "all", jitter = 0.3)
boxplot.stats(covid19PEMun$casos)$out
boxplot.stats(covid19PEMun$casos, coef = 2)$out

covid19PEOut <- boxplot.stats(covid19PEMun$casos)$out
covid19PEOutIndex <- which(covid19PEMun$casos %in% c(covid19PEOut))
covid19PEOutIndex

# filtro de Hamper
lower_bound <- median(covid19PEMun$casos) - 3 * mad(covid19PEMun$casos, constant = 1)
upper_bound <- median(covid19PEMun$casos) + 3 * mad(covid19PEMun$casos, constant = 1)
(outlier_ind <- which(covid19PEMun$casos < lower_bound | covid19PEMun$casos > upper_bound))

# teste de Rosner
library(EnvStats)
covid19PERosner <- rosnerTest(covid19PEMun$casos, k = 10)
covid19PERosner
covid19PERosner$all.stats

# resolução do exercicio ####
# Compartilhe com a gente um código criado por você usando uma das técnicas de identificação de outliers, mas no lugar da variável casos, busque em uma das outras duas variáveis ajustadas (casos2 ou casosLog)


covid19PERosner_casos2 <- rosnerTest(covid19PEMun$casos2, k = 10)
covid19PERosner_casos2
covid19PERosner_casos2$all.stats

covid19PERosner_casosLog <- rosnerTest(covid19PEMun$casosLog, k = 10)
covid19PERosner_casosLog
covid19PERosner_casosLog$all.stats
