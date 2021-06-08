# script do professor
library(dplyr)

# sumários
count(facebook, Type) 

# sumários com agrupamentos
facebook %>% group_by(Type) %>% summarise(avg = mean(like))

### Transformação de Casos

# seleção de casos
facebook %>%  filter(Type != "Photo") %>% summarise(avg = mean(like))
facebook %>%  filter(Type != "Photo") %>% group_by(Type, Paid) %>% summarise(avg = mean(like))

# ordenar casos
arrange(facebook, like) # ascendente
arrange(facebook, desc(like)) # descendente

### Transformação de Variáveis

# seleção de colunas
facebook %>% select(like, Type, Paid) %>% arrange(like)

# novas colunas
facebook %>% mutate(likePerLifeTime = like/Lifetime.Post.Total.Reach)

# renomear
facebook %>% rename(Reach = Lifetime.Post.Total.Reach)

# exercicio ####
# Compartilhe com a gente um código criado por você com a aplicação de pelo menos um sumário, um agrupamento, uma manipulação de casos e uma manipulação de colunas.


# sumários

iris_df <- iris
count(irisdf) 

iris_df

# sumários com agrupamentos
iris_df %>% group_by(Species) %>% summarise(avg = mean(Sepal.Length))

### Transformação de Casos

# seleção de casos
iris_df <- iris
iris_df %>% filter(Species != "versicolor") %>% group_by(Species, Sepal.Length) %>% summarise(avg = mean(Petal.Length))

#coluna, criando uma variável index
index_iris_df <- seq(length(iris_df), 146)
iris_df <- cbind(iris_df, index_iris_df)
