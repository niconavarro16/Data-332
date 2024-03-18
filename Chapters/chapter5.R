deck2 <- deck

vec <- c(0, 0, 0, 0, 0, 0)
vec
vec[1]

vec[1] <- 1000
vec

vec[c(1, 3, 5)] <- c(1, 1, 1)
vec
vec[4:6] <- vec[4:6] + 1
vec
vec[7] <- 0
vec

deck2$new <- 1:52 #adding a column(new)
head(deck2)
deck2$new <- NULL #removing a column(new)
head(deck2)

#where the aces are
deck2[c(13, 26, 39, 52), ]
deck2$value[c(13, 26, 39, 52)] #to see the value in those positions

deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)
# or
deck2$value[c(13, 26, 39, 52)] <- 14

head(deck2, 13)#checking the first 13 cards

#But what if the deck had been shuffled?
deck3 <- shuffle(deck) #Where are the aces now?
head(deck3)

#Logical Operators
1 > 2
1 > c(0, 1, 2)
c(1, 2, 3) == c(3, 2, 1)

1 %in% c(3, 4, 5)
## FALSE
c(1, 2) %in% c(3, 4, 5)
## FALSE FALSE
c(1, 2, 3) %in% c(3, 4, 5)
## FALSE FALSE TRUE
c(1, 2, 3, 4) %in% c(3, 4, 5)
## FALSE FALSE TRUE TRUE

##Exercise
deck2$face
deck2$face == "ace"
sum(deck2$face == "ace")

deck3$face == "ace"
deck3$value[deck3$face == "ace"]
deck3$value[deck3$face == "ace"] <- 14 #changing ace values to 14
head(deck3)

deck4 <- deck #playing an invented game
deck4$value <- 0
head(deck4, 13)

##Exercise (Assign a value of 1 to every card in deck4 that has a suit of hearts)
deck4$suit == "hearts"
deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"] <- 1 ##assigning a 1 to the hearts

deck4[deck4$face == "queen", ] #finding the queen
deck4[deck4$suit == "spades", ] #finding spades

#boolean operators
a <- c(1, 2, 3)
b <- c(1, 2, 3)
c <- c(1, 2, 4)
a == b
b == c
a == b & b == c

#Could you use a Boolean operator to locate the queen of spades in your deck?
deck4$suit == "spades" & deck$face == "queen"
queenOfSpades <- deck4$face == "queen" & deck4$suit == "spades" #saving the queen of spades
deck4[queenOfSpades, ]
deck4$value[queenOfSpades]
deck4$value[queenOfSpades] <- 13 #giving queen of spades the value 13
deck4[queenOfSpades, ]

#Exercise
  #Is w positive?
  w <- c(-1, 0, 1)
  #Is x greater than 10 and less than 20?
  x <- c(5, 15)
  #Is object y the word February?
  y <- "February"
  #Is every value in z a day of the week?
  z <- c("Monday", "Tuesday", "Friday")

  w > 0
  10 < x & x < 20
  y == "February"
  all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
               "Saturday", "Sunday"))

#playing Blackjack  
deck5 <- deck
head(deck5, 13)
facecard <- deck5$face %in% c("king", "queen", "jack")
deck5[facecard, ]
deck5$value[facecard] <- 10 #adding the value 10 to the kings, queens and jacks
head(deck5, 13)  

#missing information
1 + NA
NA == 1

##na.rm (NA remove)
c(NA, 1:50)
mean(c(NA, 1:50))
mean(c(NA, 1:50), na.rm = TRUE)

##is.na 
is.na(NA)
vec <- c(1, 2, 3, NA)
is.na(vec)
deck5$value[deck5$face == "ace"] <- NA
head(deck5, 13)
