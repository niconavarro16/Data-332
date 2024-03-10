1 + 1

100:130

5-
1  

2*3
##6
4-1
##3
6/(4-1)
##2

#Exercise:
10+2
12*3
36-6
30/3

1:6

a <- 1
a
a + 2

die <- 1:6
die

Name <- 1
name <- 0
Name + 1

my_number <- 1
my_number
my_number <- 999
my_number

ls()

die - 1
die / 2
die * die

1:2
1:4
die
die + 1:2
die + 1:4

die * c(1,2)

die %*% die
die %o% die

round(3.1415)
factorial(3)

mean(1:6)
mean(die)
round(mean(die))

sample(x = 1:4, size = 2)
sample(x = die, size = 1)
sample(x = die, size = 1)
sample(x = die, size = 1)
sample(die, size = 1)

round(3.1415, corners = 2)
## Error in round(3.1415, corners = 2) : unused argument(s) (corners = 2)
args(round)
## function (x, digits = 0)
## NULL
round(3.1415, digits = 2)

sample(die, size = 2, replace = TRUE)

dice <- sample(die, size = 2, replace = TRUE)
sum(dice)

my_function <- function() {}
roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

roll2 <- function(bones) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}

roll2(bones = 1:4)
