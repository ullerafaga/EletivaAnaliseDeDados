# exercício 1 - instruções ####
# primeiro exercício tem por base o que aprendemos na introdução do curso, e no 
#tópico de Programação com R. 

#1. Crie um data frame com pelo menos 500 casos e a seguinte composição: duas 
#variáveis normais de desvio padrão diferente, uma variável de contagem 
#(poisson), uma variável de contagem com dispersão (binomial negativa), uma 
#variável binomial (0,1), uma variável qualitativa que apresenta um valor quando
#a variável binomial é 0 e outro quando é 1, e uma variável de index. 

#⭕ As variáveis (normais, contagem e binomial) devem ser simuladas!!!
  
#2. Centralize as variáveis normais. 
#3. Troque os zeros (0) por um (1) nas variáveis de contagem. 
#4. Crie um novo data.frame com amostra (100 casos) da base de dados original. 

#▶ Compartilhe com a gente o seu endereço de github com o código do 
#exercícicio!!!

# 1 - criando o data frame conforme instruído ####
# criando um data frame com 500 dados que tenha 2 variáveis normais, uma 
#variável de contagem, uma variável de contagem (poisson), uma variável de
#contagem com dispersão (binomial negativa), uma variável binomial (0,1), uma
#variável qualitativa que apresenta um valor quando a variável binomial é 0 e 
# outro quando a variável binomial é um, e uma variável de index

# 1a vou criar a primeira distribuição, da primeira variável normal####

tarefaSemente_exercicio1a <- addTaskCallback(function(...) {set.seed(88);TRUE}) 
# atribui a tarefa à variável tarefaSemente_exercicio1a
tarefaSemente_exercicio1a # chama a tarefa semente

# distribuição normal simulada
vnormal1_ex1 <- rnorm(500) # usa a função rnorm para criar 
#uma distribuição normal, indicando o total de casos, coloquei 500 já que era o 
#mínimo requerido pelo exercício

removeTaskCallback(tarefaSemente_exercicio1a) #já que a primeira variável já foi
#criada, usamos a função para retirar a tarefa

summary(vnormal1_ex1) # sumário da distribuição
view(vnormal1_ex1)
sd(vnormal1_ex1) # verificando o desvio padrão

# 1b agora criarei a segunda distribuição, da segunda variável normal ####

tarefaSemente_exercicio1b <- addTaskCallback(function(...) {set.seed(99);TRUE}) 
# atribui a tarefa à variável tarefaSemente_exercicio1b
tarefaSemente_exercicio1b # chama a tarefa semente

# distribuição normal simulada
vnormal2_ex1 <- rnorm(500) # usa a função rnorm para criar 
#uma distribuição normal, indicando o total de casos, coloquei 500 já que era o 
#mínimo requerido pelo exercício

removeTaskCallback(tarefaSemente_exercicio1b) #já que a primeira variável já foi
#criada, usamos a função para retirar a tarefa

summary(vnormal2_ex1) # sumário da distribuição
view(vnormal2_ex1)
sd(vnormal2_ex1) # verificando o desvio padrão

# 1c criando a simulação com a variável de contagem (poisson) ####
poisson_ex1 <- rpois(500, 3)
poisson_ex1

# 1d criando a simulação com a variável de contagem com dispersão negativa ####
binomialneg_ex1 <- rnbinom(500, mu = 3, size = 10)
binomialneg_ex1

# 1e distribuição binomial simulada (dummy) ####
dummy_ex1 <- rbinom(500, 1, 0.7) # rbinom para criar 
#distribuição binominal, indicando casos, tamanho e probabilidade
dummy_ex1

# juntando os elementos criados até o momento em um data frame
df_ex1 <- cbind(vnormal1_ex1, vnormal2_ex1, poisson_ex1, binomialneg_ex1, 
                dummy_ex1)

View(df_ex1)
df_ex1

# 1f criando uma variável quali para os valores da dummy ####
qualiDummy_ex1 <- ifelse(df_ex1[ , 5] == '1', 'Male', 
                                           'Female')
qualiDummy_ex1 <- as_tibble(qualiDummy_ex1)

View(qualiDummy_ex1)

#colocando a variável quali da dummy no data frame
# 1g criando variável index ####
index_ex1 <- seq(length(df_ex1), 506) # vetor com índex dos dados, usando a 
#função length para pegar o total de casos. Usei "506" por que, por algum motivo,
# os valores começavam em 7. Coloquei 506 para que todos os casos fossem 
#utilizados, e depois subtraí 6 para que o primeiro caso tivesse valor 1.
view(index_ex1)
index_ex1 <- index_ex1 - 6
index_ex1 <- as.tibble(index_ex1)
view(index_ex1)

# criando data frame final ####

df_ex1 <- cbind(vnormal1_ex1, vnormal2_ex1, poisson_ex1, binomialneg_ex1, 
                dummy_ex1, qualiDummy_ex1, index_ex1)

View(df_ex1)

# 2 - centralizando as variáveis normais ####
cent_vnormal1_ex1 <- vnormal1_ex1 - mean(vnormal1_ex1)
cent_vnormal1_ex1
hist(vnormal1_ex1)
hist(cent_vnormal1_ex1)

cent_vnormal2_ex1 <- vnormal2_ex1 - mean(vnormal2_ex1)
cent_vnormal2_ex1
hist(vnormal2_ex1)
hist(cent_vnormal2_ex1)

# 3 - trocando os 0's por 1 nas variáveis de contagem ####
# 3a variável de contagem (poisson), trocando os valores "0" por "1" ####
poisson_ex1
poisson_ex1_troca <- ifelse((poisson_ex1) == '0', '1', poisson_ex1)
poisson_ex1_troca

# 3b variável de contagem com dispersão (binomial negativa) ####
binomialneg_ex1
binomialneg_ex1_troca <- ifelse((binomialneg_ex1) == '0', '1', binomialneg_ex1)
binomialneg_ex1_troca

# 4 - criando um novo data.frame com uma amostra de 100 casos do df original ####
df_ex1
df_ex1 <- as.data.frame(df_ex1)
df_ex1_amostra <- sample_n(df_ex1, 100, replace = FALSE)

df_ex1_amostra
