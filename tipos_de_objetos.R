# script do professor####
# tipos de objetos no R

# vetor
vetor1 <- c(1, 2, 3, 4, 5, 6) # vetor usando a função c (concatenar)

is.vector(vetor1) # testa se é vetor
typeof(vetor1) # tipo do objeto
class(vetor1) # classe do objeto
str(vetor1) # estrutura do objeto
length(vetor1) # tamanho objeto

# array
array1 <- array(c(c('João', 'Luis', 'Ana', 'Claudia'), 21:24), dim = c(2, 2, 2)) # cria array usando as funções array e c

is.array(array1) # teste se é array
typeof(array1) # tipo do objeto
class(array1) # classe do objeto
str(array1) # estrutura do objeto
length(array1) # tamanho objeto

# matriz
matrix1 <- matrix(vetor1, nrow = 2)

is.matrix(matrix1) # teste se é matriz
typeof(matrix1) # tipo do objeto
class(matrix1) # classe do objeto
str(matrix1) # estrutura do objeto
length(matrix1) # tamanho objeto

# lista
regCarros <- lm(mpg ~ ., mtcars) # criação de um modelo de regressão

is.list(regCarros) # teste se é lista
typeof(regCarros) # tipo do objeto
class(regCarros) # classe do objeto
str(regCarros) # estrutura do objeto
length(regCarros) # tamanho objeto

# data frame / quadro de dados
iris # data frame nativo do R

is.data.frame(iris) # teste se é lista
typeof(iris) # tipo do objeto
class(iris) # classe do objeto
str(iris) # estrutura do objeto
length(iris) # tamanho objeto

#### Vamos criar nosso próprio data.frame
# minha resolução do exercício ####
# criando meu próprio dataframe

# vetor com nomes dos meus cachorros
dogs <- c("Amaterasu", "Gilbert", "Angelina", "Princesa")

# vetor com as raças deles
breeds <- c("Akita", "Yorkshire Terrier", "Tatu com cobra", "Poodle")

# vetor com as datas de nascimento deles
nascimentoDogs <- as.Date(c("2018-04-03", "2014-02-14", "2004-03-03", 
                            "2005-08-08"))

#vetor com as idades
idadeDogs <- round( age_calc( nascimentoDogs, units = 'years')) # Idade usando a
#função age_calc do pacote eeptools e a função round (arredondar)

# data.frame com base nos vetores
listaDogs <- data.frame(
  nome = dogs,      # Nome 
  raça = breeds, # Raça
  dataNascimento = nascimentoDogs, # Data de nascimento
  idade = idadeDogs # idade
  ) 

View(listaDogs)
str(listaDogs)