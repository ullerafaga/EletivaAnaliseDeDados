# script do professor ####
# função
f <- function() {
  cat("Hello, world!\n")
}
f()

# função com estrutura de repetição
f <- function(nro) {
  for(i in 1:nro) {
    cat("Hello, world!\n")
  }
}
f(3)

# função com estrutura condicional e de repetição
f <- function(nro) {
  if(nro < 100) {
    for(i in 1:nro) {
      cat("Hello, world!\n")
    }
  } else {
    cat("Tá de brincadeira imprimir isso tudo")
  }
}
f(99)
f(100)

# agora, uma função mais útil...
centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

centralizacao(irisCopia$Sepal.Length)

centralizacao <- function(x) {
  x <- x - mean(x)
}

centralizacao(irisCopia$Sepal.Length)
centroTeste <- centralizacao(irisCopia$Sepal.Length)

# resolução do exercício ####
# exercício: Compartilhe com a gente um código em que você cria uma função. 
#Lembre-se de compartilhar um link do github!!!

# dado que todos têm que passar pelo exercício do "Hello, world!", criarei uma 
#função inútil, mas didática.

# função com estrutura condicional e de repetição
f <- function(nro) {
  if(nro < 10) {
    for(i in 1:nro) {
      cat("Hakuna Matata!\n")
    }
  } else {
    cat("É lindo dizer!")
  }
}
f(5)
f(50)

