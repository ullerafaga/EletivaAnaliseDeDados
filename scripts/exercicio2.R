# enunciado ####
#1. Extraia em padrão ff todas as bases de situação final de alunos disponíveis neste endereço: http://dados.recife.pe.gov.br/dataset/situacao-final-dos-alunos-por-periodo-letivo
#2. Junte todas as bases extraídas em um único objeto ff
#3. Limpe sua staging area
#4. Exporte a base única em formato nativo do R

install.packages('magrittr')
install.packages('rvest')
library(rvest)
library(magrittr)

#baixando os bancos de dados. Professor, favor ignorar essa parte, estou colocando para fins de estudo! ####

setwd( "/Users/ulle/OneDrive/DoutoradoCPRI/EletivaDeAnaliseDeDados/EletivaAnaliseDeDados/Exercicios/bases_originais")
links_dos_bancos <- as.data.frame( read_html( "http://dados.recife.pe.gov.br/dataset/situacao-final-dos-alunos-por-periodo-letivo" ) %>%
                                     html_nodes( "[class='resource-url-analytics']" ) %>%
                                     html_attr( "href" ) )

colnames( links_dos_bancos ) <- "Links"

links_dos_bancos <- links_dos_bancos[ grep( "csv", links_dos_bancos$Links ), ]

for( url in links_dos_bancos ){
  
  download.file( url, destfile = basename( url ) )
}

# extraindo as bases csv em padrão ff. Sei como fazer mas preciso ainda entender como otimizaria esse código. provavelmente transfomando a função em um objeto? Houve muita repetição que creio que poderia ser evitada. ####

install.packages('ff')
library(ff)
install.packages('ffbase')
library(ffbase)

situacaofinalalunos2011 <- 'situacaofinalalunos2011.csv'
system.time(situacaofinalalunos2011 <- read.csv.ffdf(file=situacaofinalalunos2011))

situacaofinalalunos2012 <- 'situacaofinalalunos2012.csv'
system.time(situacaofinalalunos2012 <- read.csv.ffdf(file=situacaofinalalunos2012))

situacaofinalalunos2013 <- 'situacaofinalalunos2013.csv'
system.time(situacaofinalalunos2013 <- as.ffdf(read.csv.ffdf(file=situacaofinalalunos2013)))

situacaofinalalunos2014 <- 'situacaofinalalunos2014.csv'
system.time(situacaofinalalunos2014 <- read.csv.ffdf(file=situacaofinalalunos2014))

situacaofinalalunos2015 <- 'situacaofinalalunos2015.csv'
system.time(situacaofinalalunos2015 <- read.csv.ffdf(file=situacaofinalalunos2015))

situacaofinalalunos2016 <- 'situacaofinalalunos2016.csv'
system.time(situacaofinalalunos2016 <- read.csv.ffdf(file=situacaofinalalunos2016))

situacaofinalalunos2017 <- 'situacaofinalalunos2017.csv'
system.time(situacaofinalalunos2017 <- read.csv.ffdf(file=situacaofinalalunos2017))

situacaofinalalunos2018 <- 'situacaofinalalunos2018.csv'
system.time(situacaofinalalunos2018 <- read.csv.ffdf(file=situacaofinalalunos2018))

situacaofinalalunos2019 <- 'situacaofinalalunos2019.csv'
system.time(situacaofinalalunos2019 <- read.csv.ffdf(file=situacaofinalalunos2019))

situacaofinalalunos2020 <- 'situacaofinalalunos2020.csv'
system.time(situacaofinalalunos2020 <- read.csv.ffdf(file=situacaofinalalunos2020))

# juntando as bases em um único objeto ff ####
setwd( "/Users/ulle/OneDrive/DoutoradoCPRI/EletivaDeAnaliseDeDados/EletivaAnaliseDeDados/Exercicios/bases_tratadas")

bd_exercicio2 <- ffdfrbind.fill(situacaofinalalunos2011, situacaofinalalunos2012, situacaofinalalunos2013, situacaofinalalunos2014, situacaofinalalunos2015, situacaofinalalunos2016, situacaofinalalunos2017, situacaofinalalunos2018, situacaofinalalunos2019, situacaofinalalunos2020, clone = TRUE)

# limpando a staging area, vou limpar todos os objetos menos a base de dados final que preciso ####

rm(list=(ls()[ls()!="bd_exercicio2"]))

# exportando a base única em um formato nativo do R ####
saveRDS(bd_exercicio2, file = "bd_exercicio2.rds")


