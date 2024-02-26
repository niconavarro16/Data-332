#atomic vector
die <- c(1,2,3,4,5,6)
die

#whether it is an atomic vector or not 
is.vector(die)

five <- 5
five
is.vector(five)

#measuring the length
length(five)
length(die)

int <- 1L
text <- "ace"

int <- c(1L, 5L)
text <- c("ace", "hearts")

sum(num)
sum(text)

#6 types of atomic vectors in R
#1. Doubles
die <- c(1, 2, 3, 4, 5, 6)
die
 #how to know the object we are working with
typeof(die)

#2.Integers
int <- c(-1L, 2L, 4L)
int
typeof(int)

sqrt(2)^2 - 2

#3.Characters
text <- c("Hello", "World")
text
typeof(text)
typeof("Hello")

#4.Logicals
logic <- c(TRUE, FALSE, TRUE)
logic
typeof(logic)
typeof(F)

#5.Complex and Raw
comp <- c(1 + 1i, 1 + 2i, 1 + 3i)
comp
typeof(comp)

raw(3)
typeof(raw(3))

  #Exercise
  hand <- c("ace", "king", "queen", "jack", "ten")
  hand
  typeof(hand)

#names
names(die) <- c("one", "two", "three", "four", "five", "six")
names(die)
attributes(die)

die
die + 1
names(die) <- c("uno", "dos", "tres", "quatro", "cinco", "seis")
die

names(die) <- NULL
die

#Dim
dim(die) <- c(2, 3)
die

dim(die) <- c(3, 2)
die

dim(die) <- c(1, 2, 3)
die

#Matrices
m <- matrix(die, nrow = 2)
m

#Arrays
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

  #Exercise
  hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades",
           "spades", "spades", "spades")
  matrix(hand1, nrow = 5, byrow = FALSE)
  
#Class
class(die)
attributes(die)  

#Dates and Time
now <- Sys.time()
now
typeof(now)
class(now)
unclass(now)

mil <- 1000000
mil
class(mil) <- c("POSIXct", "POSIXt")
mil

#Factors
gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)
unclass(gender)
as.character(gender)

  #Exercise
  card <- c("ace", "hearts", 1)
  card
  
#Coercion
sum(c(TRUE, TRUE, FALSE, FALSE))
as.character(1)
as.logical(1)
as.numeric(FALSE)
#Lists
list1 <- list(100:130)
list1
  #Exercise
  card <- list("ace", "hearts", 1)
  card

#Data frames
df <- data.frame(face = c("ace", "two", "six"),
        suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df

head(deck)

#Saving Data
write.csv(deck, file = "cards.csv", row.names = FALSE)
getwd()
