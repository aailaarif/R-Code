# iteration_lab.R
# Aaila Arif, s1324028		
# CS-201						
# Spring 2023

# Problem 1: Write an equivalent while loop for the following code:

v <- vector(mode="numeric", length=10) # creates a 10-element vector of 0s

for(i in 1:10) {
  v[i] <- (i+2)^2 
}

print(v)
#////////////////////////////////////////////
v <- vector(mode="numeric", length=10)
i <- 0
while(i<11){
  v[i] <- (i+2)^2
  i <- i+1
}
print(v)
#////////////////////////////////////////////
#Part 2: Write an equivalent for loop for the following code:
i <- 0
seq <- ''
while(i < 50) {
  cat(seq, i %% 2, '\n', sep='')
  i <- i + 1
  seq <- paste(seq, ' ', sep='')
}
#////////////////////////////////////////////
seq <- ''
for(i in 0:49){
  cat(seq, i %% 2, '\n', sep='')
  seq <- paste(seq, ' ', sep='')
}

#Part 3: Write an equivalent for or while loop for the following code:
x <- c(2, 5, 3, 9, 8, 11, 6)
div <- as.integer((min(x)+max(x))/2)
x <- x %% div + 1
print(x)

#////////////////////////////////////////////
ve vector("numeric", length(x))
x <- c(2, 5, 3, 9, 8, 11, 6)
div <- as.integer((min(x)+max(x))/2)
for(i in x){
  y <- x %% div + 1
  vec.
}
print (vec)

#Problem 2:  Write R code to print the Ulam sequence for a given 
#value of n using a while loop
n <- 3
seq <- ''
seq <- paste(seq, "", n, "->")
while(n > 1) {
  if( n == 1){
    break
  }
  else if( n%%2 == 0 ) {
    n <- n/2
    if(n!=1)
      seq <- paste(seq, "", n,"->")
    else
      seq <- paste(seq,"", n)
  }
  else{
    n <- (3*n) + 1
    if(n!=1)
      seq <- paste(seq, "", n,"->")
    else
      seq <- paste(seq,"", n)
  }
}
print (seq)

