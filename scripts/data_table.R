# script do professor #####library(data.table)
library(dplyr)

irisDT <- iris %>% setDT()
class(irisDT)

irisDT[Species == 'setosa', ] #i, j, by

irisDT[Species != 'setosa', ]

irisDT[Sepal.Length > 5 & species == 'setosa', ]

irisDT[.N]

irisDT[(.N-3)]

irisDT[ , Species]

cols <- c("Species", "Petal.Width")
irisDT[ , ..cols]

irisDT[Species == 'setosa', ][Sepal.Length > 5, ]

irisDT[ , .(Sepal.Length = mean(Sepal.Length, na.rm = T))]

irisDT[ , lm(formula = Sepal.Length ~ species + Sepal.Width + Petal.Length + Petal.Width)]

irisDT[ , .(Sepal.Length = mean(Sepal.Length, na.rm = T)), by = species]

# exercicio ####
# Compartilhe com a gente um código criado por você com a aplicação direta do sumário de uma regressão linear, usando a sintaxe de data table.


swiss_df <- swiss %>% setDT()
class(swiss)


swiss_df[ , lm(formula = swiss_df$Fertility ~ swiss_df$Agriculture + swiss_df$Examination + swiss_df$Education + swiss_df$Catholic)]
