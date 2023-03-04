# cs201_asn_3.R
# Aaila Arif, s1324028	
# CS-201					
# Spring 2023	

#Problem 1: Write and test the function rand_elem() that 
#returns one element at random from an input vector. The function 
#would be called as follows:

rand_elem <- function(vec) {
  returnIndex <- sample(length(vec), 1)
  returnValue <- vec[[returnIndex]]
  return(returnValue)
}

rand_elem(1:6)				# return one random integer between 1 and 6
rand_elem(c('yes', 'no', 'maybe'))	# return "yes", "no" or "maybe"
rand_elem(v = c(2, 4, 6, 8, 10))		# return 2, 4, 6, 8 or 10
rand_elem(vec = c('A', 'J', 'Q', 'K'))	# return "A", "J", "Q" or "K"


# All of the above would be valid ways to call rand_elem().
#Use the R sample() and length() functions inside the body of the rand_elem 
#function. Do not use just the sample() function by itself.

#Problem 2: Write and test the function even_odd() that accepts a vector of 
#integers as input and returns a two-element vector containing the number 
#of evens and the number of odds. The function would be used as follows:

even_odd <- function(v){

  returnEven <- (sum(ifelse(v %% 2 == 0 & v!= 0 ,1, 0)))
  returnOdd <- (sum(ifelse(v %% 2 != 0, 1, 0)))
  return(paste(returnEven,returnOdd))
}
even_odd(9:1)						# returns 4 5	 (4 evens, 5 odds)
even_odd(c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))	# returns 4 5	 (4 evens, 5 odds)

#Zero is not considered an even number. Use the ifelse() and sum() functions
#inside the body of the even_odd function.

#Problem 3: R has a group of built-in datasets for US state data, 
#including state.x77, a matrix containing state data including population and
#area. Write and test the function pop_density() that accepts a state name 
#as input and returns the population density in people per square mile:
#In the body of the pop_density() function, compute a 'density' vector from the 
#first column and eighth column of the state.x77 matrix, which are the
#'Population' and 'Area' columns, respectively. Note that the 'density' vector 
#will be a named vector.

pop_density <- function(stateName) {
  pop <- state.x77[,"Population"]
  pop <- pop * 1000
  area <- state.x77[,"Area"]
  density <- c(pop/area)
  density <- c(round(pop/area, digits=4))
  populationDensity <- (density[stateName])
  paste(stateName, ":", populationDensity, " people per square mile")
  
}

pop_density('New Jersey')
# returns
 "New Jersey: 975.0033 people per square mile"


pop_density('Wyoming')
# returns
 "Wyoming: 3.8682 people per square mile"

#Problem 4: 
#Part 1: Write a for loop to call the flips() function 1000 times and store 
#the 1000 resulting values in the vector called 'flips_vec'.
flips <- function() {
  total_flips <- 0
  nheads <- 0
  
  
  # if nheads becomes 3, we got three 'heads' in a row
  while (nheads < 3) {
    if (sample(c("T", "H"), 1) == "H") {
      nheads <- nheads + 1
    } else {
      # didn't get heads; must reset to 0
      nheads <- 0
    }
    
    
    total_flips <- total_flips + 1
  } # end while
  
  return(total_flips)
  
  
} # end flips()

forVec <- c(1:1000)
flips_vec <- c()
for(i in forVec){
  value <- flips()
  flips_vec <- append(value, flips_vec)
}

#Part 2: Then, as you did in Assignment 1, Problem 4, count the frequencies 
#of the number of flips in flips_vec and generate a bar plot of flips 
#frequencies, with x-axis label "Number of coin flips" and y-axis label 
#"Occurrences"

occurrences <- table(flips_vec)
barplot(occurrences, xlab="Number of coin flips", ylab="Occurrences")
#What is the most frequent number of coin flips required to get 3 heads in a row?
#The most frequent number of flips is 3 flips

#Part 3:In R, the apply family of functions often makes it unnecessary to
#write loops. The replicate() function is a simplified version of sapply() 
#that allows you to repeat an expression or function a set number of times. 
#see ?replicate in the R console and this link. Repeat part a) using the 
#replicate() function instead of the for loop.

replicate_flips_vec <- replicate(n=1000, flips())
occurrences <- table(replicate_flips_vec)
barplot(occurrences, xlab="Number of coin flips", ylab="Occurrences")

#Part 4: What is the most frequent number of coin flips required to get 
#3 heads in a row?
#The most frequent number is 3 flips.

#Part 5:Based on the results of a) or b), what is your approximation of the 
#of getting 3 heads in a row in just 3 coin tosses?
#Based on the results of a and b, the chances of getting 3 heads in a row in 
#3 coin tosses is about 11%

