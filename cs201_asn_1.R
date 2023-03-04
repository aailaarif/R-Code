# cs201_asn_1.R
# Aaila Arif, s1324028		
# CS-201							
# Spring 2023	

#Problem 1 
# Part 1: What happens when you try to make a vector contain different types, 
#using the c( ) function? When you try to make a vector containing different 
#types with the c() function, the most complex type wins. All other elements are
#converted to that type via coercion.

# Part 2: Try to make a vector containing some numbers and some strings.
myvec <- c(12, "ten", 20, 'twenty', 5L)
myvec

# Part 3: Why does the output show the numbers surrounded by quotes " "?
#Since Strings/Characters are more complex than doubles and numerics, the 
#most complex type wins and all elements are converted to characters (coercion 
#causes the numbers to be represented in quotes).

#Problem 2
# Part 1: Let's say a cafeteria is using R to create their breakfast menu.
items <- c("spam", "eggs", "beans", "bacon", "sausage")
print(items)

# Part 2: What does items[-3] produce?
items[-3]
print(items[-3])
#items[-3] produces a vector containing everything but the third element in items

# Part 3: Based on what you find, use indexing to create a version of the items
#vector without "spam".
items[-1]
print(items[-1])

# Part 4: Use indexing to create a vector called more_spam from items;
#more_spam will contain spam, eggs, sausage, spam, and spam.

more_spam <- c(items[-(3:4)], items[1], items[1])
print(more_spam)

# Part 5:Add a new item, "lobster", to the items vector.

items <- c(items, "lobster")
print(items)

#Problem 4:
#In the R script file cs201_asn_1.R, write R code to perform the following tasks
#Generate a character matrix that contains the following tic-tac-toe pattern:

#X O X
#O X O
#X O X
# Part 1:
#Do this in two different ways, once by using the matrix() function

tictactoe1 <- matrix(c("X", "O", "X",
                   "O","X", "O",
                   "X", "O", "X"), nrow = 3, ncol = 3)
print(tictactoe1)
# Part 2:
#and once without the matrix() function.

tictactoe2 <- c("X","O","X","O","X","O","X","O","X")
dim(tictactoe2) <- c(3, 3)

print(tictactoe2)

# Part 3:
#Print the matrix
print(tictactoe1)
print(tictactoe2)

#Actual output of the matrix in the R console would look like this:
#[,1] [,2] [,3]
#[1,] "X"  "O"  "X" 
#[2,] "O"  "X"  "O" 
#[3,] "X"  "O"  "X"

#Problem 4:
#In the R script file cs201_asn_1.R, write R code to perform the following 
#tasks. Document all your code with comments.

#Part 1:
#Simulate rolling a pair of standard six-sided dice 1000 times.
#Use vectors die1 and die2 to hold the values of the 1000 rolls for each die
#You will want to use the R sample() function to generate the 1000 
#random integers in the vectors

die1 <- sample(1:6, 1000, replace=T)
die2 <- sample(1:6, 1000, replace=T)

# Part 2:
#Store the sums of the 1000 dice rolls in the vector dice_sums.
dice_sums <- die1 + die2

# Part 3:
#Count the frequencies of the dice sums in dice_sums and generate a 
#bar plot of dice sum frequencies with the axis labels shown below.

occurrences <- table(dice_sums)
barplot(occurrences, xlab="dice sums", ylab="occurrences")










