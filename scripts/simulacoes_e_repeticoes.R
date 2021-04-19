# script do professor ####
# seta a semente aleatória de geração de dados
# usando a função addTaskCallback deixamos a set.seed fixa, rodando no back

tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE}) # atribui a tarefa à variável tarefaSemente
tarefaSemente # chama a tarefaSemente

# distribuição normal simulada
distNormalSimulacao <- rnorm(100) # usa a função rnorm para criar uma distribuição normal, indicando o total de casos

summary(distNormalSimulacao) # sumário da distNormalSimulacao

# distribuição binomial simulada
distBinominalSimulacao <- rbinom(100, 1, 0.7) # rbinom para criar distribuição binominal, indicando casos, tamanho e probabilidade

# repetições
classeSimulacao <- c(rep("Jovem", length(distBinominalSimulacao)/2), rep("Jovem Adulto", length(distBinominalSimulacao)/2)) # vetor repetindo a classe Jovem 15x e Jovem Adulto 15x

# sequências
indexSimulacao <- seq(1, length(distNormalSimulacao)) # vetor com índex dos dados, usando a função length para pegar o total de casos

# por fim, podemos usar a função removeTaskCallback para remover a tarefa que criamos lá em cima
removeTaskCallback(tarefaSemente)

# resolucao do exercício ####
# exercício: Compartilhe com a gente um código criado por você com pelo menos 
#uma variável normal, uma variável binomial e uma variável de index. Lembre-se 
#de compartilhar um link do github!!!

#usando a função addTaskCallback deixamos a set.seed fixa, rodando no back
tarefaSemente_exercicio <- addTaskCallback(function(...) {set.seed(123);TRUE}) 
# atribui a tarefa à variável tarefaSemente_exercicio
tarefaSemente_exercicio # chama a tarefaSemente_exercicio

# criando uma variável com distribuição normal
# distribuição normal simulada
distNormalSimulacao_exercicio <- rnorm(150) # usa a função rnorm para criar uma
#distribuição normal, indicando o total de casos

summary(distNormalSimulacao_exercicio) # sumário da
#distNormalSimulacao_exercicio

# criando uma variável binomial
# distribuição binomial simulada
distBinominalSimulacao_exercicio <- rbinom(150, 1, 0.7) # rbinom para criar
#distribuição binominal, indicando casos, tamanho e probabilidade. Foi mantida a
#probabilidade de 70% pelo fato de que o professor indicar que era útil em 
#machine learning

summary(distBinominalSimulacao_exercicio)
distBinominalSimulacao_exercicio

#criando uma variável de index
# sequências
indexSimulacao_exercicio <- seq(1, length(distNormalSimulacao_exercicio)) 
#vetor com índex dos dados, usando a função length para pegar o total de casos

summary(indexSimulacao_exercicio)
indexSimulacao_exercicio

# por fim, podemos usar a função removeTaskCallback para remover a tarefa que
#criamos para tarefa semente
removeTaskCallback(tarefaSemente_exercicio)
