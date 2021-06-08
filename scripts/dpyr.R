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
count(USArrests) 

# sumários com agrupamentos
USArrestsFactor %>% group_by(Rape) %>% summarise(avg = mean(like))

### Transformação de Casos

# seleção de casos
USArrests %>%  filter(Type != Rape) %>% summarise(avg = mean(like))
USArrests %>%  filter(Type != Rome) %>% group_by(Type, Paid) %>% summarise(avg = mean(like))

# ordenar casos
arrange(USArrests, like) # ascendente
arrange(fUSArrests, desc(like)) # descendente
