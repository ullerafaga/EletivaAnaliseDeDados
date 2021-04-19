# explicação ####

#O R funciona ao redor de dois elementos:

#Objetos: coisas como vetores, matrizes, dataframes, resultados de uma regressão
#ou de um modelo de inteligência artificial. Cada objeto possui atributos, ou 
#características que o definem, detalham, etc.

#Vamos ver dois exemplos de objetos no R

vetor <- c(1, 2, 3, 5, 7) # criação de um vetor

#O objeto acima é um vetor, e possui poucos atributos. Foi usada a função c para
#criar o vetor. Essa função concatena dados. Observe que a função vem antes dos 
#objetos e varíaveis que vão ser utilizados.

regCarros <- lm(mpg ~ ., mtcars) # criação de um modelo de regressão

#O objeto acima é um modelo de regressão linear, e apresenta diferentes 
#atributos, como a fórmula utilizada na criação, os coeficientes, etc. Foi usada
#a função lm para criar o vetor. Essa função cria modelos lineares. Foi usada a 
#sintaxe função(variável_dependente ~ todas_as_variáveis, base_de_dados). No 
#lugar de escrever todas as variáveis, utilizamos o ".". 


#Funções: procedimentos, ações que você executa sobre objetos. Acima, usamos, 
#por exemplo, a função lm sobre os elementos do objeto mtcars para criar um 
#modelo de regressão.

#Mais uma vez citando o YaRrr!, boa parte da programação em R é criar objetos, 
#aplicar funções, que geram novos objetos, que recebem novas funções... e assim 
#por diante, até ser gerado o resultado desejado.

# pergunta ####

#Para concluir esta atividade, envie pra gente o link do seu repositório github 
#com um exemplo de código que cria um objeto simples (como o vetor acima) e que 
#cria um objeto complexo, criado via uma função (como a regressão acima). No seu
#código também deve ter um comando que mostra a complexidade dos objetos (dica: 
#use a função str para mostrar a complexidade do seu objeto!)

#Atenção: seu código deverá seguir as boas práticas de estilo!!
#http://adv-r.had.co.nz/Style.html Advanced R by Hadley Wickham Style Guide


# resposta ####

library(tidyverse)

vetorResposta <- c(1, 1, 2, 3, 5, 8, 13, 21) # criação de um vetor simples com 
#8 elementos compostos pelos primeiros números de uma sequência fibonacci

str(vetorResposta) #conforme a dica, utilizando a função str para demonstrar a 
#complexidade do objeto. O output é uma sequência de 1 a 21 composta por 8 
#números

linearMod <- lm(dist ~ speed, data=cars)  # exemplo tirado de 
#http://r-statistics.co/Linear-Regression.html

# o exemplo utilizado foi uma regressão linear simples que trazia a distância
#como variável dependente, a velocidade como variável independente, e o banco
#de dados nativo no R, cars, como a base de dados.

print(linearMod) #visualizando o output

str(linearMod) # conforme a dica, utilizando a função str para demonstrar a 
#complexidade do objeto. O output traz uma lista de elementos que inclui
#coeficientes, resíduos, efeitos, valores ajustados, entre outros. Claramente
#mais complexa
