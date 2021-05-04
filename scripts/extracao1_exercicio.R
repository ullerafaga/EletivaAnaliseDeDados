# Script do Professor ####
#### Staging area e uso de memória

# ficamos com staging area??

ls() # lista todos os objetos no R

# vamos ver quanto cada objeto está ocupando

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

ls() # lista todos os objetos no R

# agora, vamos remover

gc() # uso explícito do garbage collector

rm(list = c('sinistrosRecife2020Raw', 'sinistrosRecife2021Raw'))

# deletando todos os elementos: rm(list = ls())
# deletando todos os elementos, menos os listados: rm(list=(ls()[ls()!="sinistrosRecifeRaw"]))

saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")
# Instruções do exercício ####
#Desta vez, mostre que você entendeu o conceito de área intermediária e ambiente no R, modificando o código para manter sinistrosRecifeRaw e a função naZero (ela pode ser útil no futuro!). Além disso, indique qual dos objetos na área intermediária mais estavam usando memória do R. Lembre-se de compartilhar um link do github!!!
 
rm(list=(ls()[ls()!="sinistrosRecifeRaw"]))

#realmente não identifiquei como colocaria mais de um elemento a ser poupado. Por agora somente criarei a função naZero novamente.
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# Sobre o uso da memória, de fato as bases de dados eram o que ocupavam mais espaço. Segue o que foi impresso antes da limpeza:

#[1]      sinistrosRecife_exercicio                       11581560
#[1]         sinistrosRecife2018Mod                        4667656
#[1]         sinistrosRecife2018Raw                        6202864
#[1]         sinistrosRecife2019Mod                        4588368
#[1]         sinistrosRecife2019Raw                        5851088
#[1]             sinistrosRecifeRaw                        2133424


