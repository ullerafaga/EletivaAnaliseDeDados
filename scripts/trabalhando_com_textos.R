# instalando os pacotes ####
install.packages('electionsBR')
install.packages('pdftools')
install.packages('textreadr')

# script 1 do professor ####
library(electionsBR)
library(dplyr)
library(stringr)
library(tidyr)

## Exemplo do Handling Strings with R
states <- rownames(USArrests)

set1 <- c("some", "random", "words", "some")
set2 <- c("some", "many", "none", "few")

grep(pattern = "k", x = states, value = TRUE) # estados com k no nome
grep(pattern = "^[wW]", x = states, value = TRUE) # estados que começam com w ou W

nchar(states) # tamanho do nome de cada estado

tolower(states) # minúsculas
toupper(states) # maiúsculas

abbreviate(states, minlength = 3, method = "both.sides") # abrevia reduzindo a 3 letras, pelos dois lados

str_replace_all(string = set1, pattern = "s", replacement = " ") # modifica um padrão # no caso, retiramos a letra 's'

union(set1, set2) # união 

## outas funções: intersect, setdiff...

set2 %in% set1 # faz uma busca de um vetor de texto em outro

## extraindo partes de acordo com delimitador

exString1 <- "EAG 6/1996 => PEC 33/1995"
sub(" =>.*", "", exString1) # extrair antes do separador
sub(".*=> ", "", exString1) # extrair depois do separador

## extraindo partes com regex
teste <- c('81 32364555', '87 32456712', '81 987251232', '50619-322')
str_extract_all(teste, "\\d{2}\\s\\d+")

# script 2 do professor ####
library(dplyr)
library(pdftools)
library(textreadr)

# ler textos (Exemplo do Handling Strings with R)
top105 <- readLines("http://www.textfiles.com/music/ktop100.txt")

# ler pdf
documentoAula <- read_pdf('programa-ELT com R.pdf', ocr = T)

# agrupar páginas em 1 doc: 1) agrupa por id 2) cria nova coluna colando a coluna texto na mesma linha 3) seleciona apenas colunas de interesse 4) remove duplicata
documentoAula2 <- documentoAula %>% group_by(element_id) %>% mutate(all_text = paste(text, collapse = " | ")) %>% select(element_id, all_text) %>% unique()

# automatização de conferência: 1) usa função grepl para buscar termos na coluna de texto 2) se os textos forem achados, classifica 
documentoAula2$classe <-  ifelse( 
  grepl("Bibliografia", documentoAula2$all_text) &
    grepl("Ciência Política", documentoAula2$all_text) &
    grepl("Avaliação", documentoAula2$all_text), "Ementa", NA)

# também podemos extrair informações de forma automática, como as datas das aulas
( datas <- str_extract_all(documentoAula2$all_text, "\\d{2}/\\d{2}") )
# resolucao do exercicio ####
# Compartilhe com a gente um código criado por você em que você carrega para o R um pdf que tenha alguma data; em seguida, troca as barras "/" das datas por hífens "-", e, por fim, faz a extração das datas usando esse novo padrão.

# carregando um pdf com data, escolhi o calendário 2021 da UFPE 
calendario_ufpe_2021 <- read_pdf('calendario_ufpe_2021.pdf', ocr = T)
View(calendario_ufpe_2021)

calendario_ufpe_2021_2 <- calendario_ufpe_2021 %>% group_by(element_id) %>% mutate(all_text = paste(text, collapse = " | ")) %>% select(element_id, all_text) %>% unique()
View(calendario_ufpe_2021_2)

( datas_exercicio <- str_extract_all(calendario_ufpe_2021_2$all_text, "\\d{2}/\\d{2}") )
datas_exercicio

datas_exercicio_final <- gsub("/", "-", datas_exercicio)
datas_exercicio_final
