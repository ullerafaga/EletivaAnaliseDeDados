# instalando os pacotes ####
install.packages('rvest')
install.packages('dplyr')

# script do professor ####
# arquivos html
library(rvest)
library(dplyr)

# tabelas da wikipedia
url <- "https://pt.wikipedia.org/wiki/%C3%93scar"

urlTables <- url %>% read_html %>% html_nodes("table")

urlLinks <- url %>% read_html %>% html_nodes("link")

filmesPremiados <- as.data.frame(html_table(urlTables[5]))

# resultados do brasileirão

resultadosBrasileirao <- read_html("https://www.cbf.com.br")

resultadosBrasileirao <- resultadosBrasileirao %>% html_nodes(".swiper-slide")

rodada <- resultadosBrasileirao %>% html_nodes(".aside-header .text-center") %>% html_text()

resultados <- resultadosBrasileirao %>% html_nodes(".aside-content .clearfix")

mandante <- resultados %>% html_nodes(".pull-left .time-sigla") %>% html_text()

visitante <- resultados %>% html_nodes(".pull-right .time-sigla") %>% html_text()

tabelaBrasileirao <- data.frame(
  mandante = mandante,
  visitante = visitante,
  time = timestamp())

write.csv2(tabelaBrasileirao, 'tabelaBrasileirao.csv')

# exercício e resolução ####
#Compartilhe com a gente um código em que você faz o scrap de alguma página, criando um data.frame. Lembre-se de compartilhar um link do github!!!

#criarei um data frame com os presidentes do parlamento húngaro desde 1990
magyarOrszággyűlésWikipedia <- "https://hu.wikipedia.org/wiki/Orsz%C3%A1ggy%C5%B1l%C3%A9s"

magyarOrszággyűlésWikipediaTables <- magyarOrszággyűlésWikipedia %>% read_html %>% html_nodes("table")

magyarOrszággyűlésWikipediaLinks <- magyarOrszággyűlésWikipedia %>% read_html %>% html_nodes("link")

magyarOrszággyűlés <- as.data.frame(html_table(magyarOrszággyűlésWikipediaTables[6]))

magyarOrszággyűlés
