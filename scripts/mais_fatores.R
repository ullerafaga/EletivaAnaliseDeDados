# instalando os pacotes
install.packages("ade4")
install.packages("arules")
installed.packages("forcats")

# script do professor ####
library(ade4)
library(arules)
library(forcats)

facebook <- read.table("bases_originais/dataset_Facebook.csv", sep=";", header = T)
str(facebook)

# conversão em fatores

for(i in 2:7) {
  facebook[,i] <- as.factor(facebook[,i]) } 

str(facebook)

# filtro por tipo de dado

factorsFacebook <- unlist(lapply(facebook, is.factor))  
facebookFactor <- facebook[ , factorsFacebook]
str(facebookFactor)

# One Hot Encoding
facebookDummy <- acm.disjonctif(facebookFactor)

# Discretização
inteirosFacebook <- unlist(lapply(facebook, is.integer))  
facebookInteiros <- facebook[, inteirosFacebook]
str(facebookInteiros)

facebookInteiros$Page.total.likes.Disc <- discretize(facebookInteiros$Page.total.likes, method = "interval", breaks = 3, labels = c("poucos", 'médio', 'muitos'))

# forcats - usando tidyverse para fatores
fct_count(facebookFactor$Type) # conta os fatores

fct_anon(facebookFactor$Type) # anonimiza os fatores

fct_lump(facebookFactor$Type, n = 1) # reclassifica os fatores em mais comum e outros

# exercicio ####
# ▶ Compartilhe com a gente um código criado por você com um processo de one hot encoding ou de discretização, e também a transformação dos fatores de uma base de dados em 3 tipos: mais frequente, segundo mais frequente e outros.

USArrests <- USArrests
USArrests
for(i in 1:3) {
  USArrests[,i] <- as.factor(USArrests[,i]) } 

str(USArrests)
factorsUSArrests <- unlist(lapply(USArrests, is.factor))  
USArrestsFactor <- USArrests[ , factorsUSArrests]
str(USArrestsFactor)

USArrests$Rape<- discretize(USArrests$Rape, method = "interval", breaks = 3, labels = c("poucos", 'médio', 'muitos'))
USArrests
