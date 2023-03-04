# cs201_asn_2.R
# Aaila Arif, s1324028
# CS-201
# Spring 2023	

#Problem 1
# Part 1: In the built-in R data frame called PlantGrowth, how many rows
#(observations) and columns (variables) are there?

dim(PlantGrowth)
#There are 30 rows(observations) and 2 columns(variables) in PlantGrowth

# Part 2:
#What data types are the variables?
str(PlantGrowth)
#weight is numeric and group is Factor
print(PlantGrowth)
# Part 3: What are the median, maximum and minimum weights 
#for each of the three groups (ctrl, trt1, trt2)?
ctrl <- PlantGrowth[PlantGrowth$group == "ctrl",]
median(ctrl$weight) # median weight for ctrl is 5.155
max(ctrl$weight) # max weight for ctrl is 6.11
min(ctrl$weight) # min weight for ctrl is 4.17

trt1 <- PlantGrowth[PlantGrowth$group == "trt1",]
median(trt1$weight) # median weight for trt1 is 4.55
max(trt1$weight) # max weight for trt1 is 6.03
min(trt1$weight) # min weight for trt1 is 3.59

trt2 <- PlantGrowth[PlantGrowth$group == "trt2",]
median(trt2$weight) # median weight for trt2 is 5.435
max(trt2$weight) # max weight for trt2 is 6.31
min(trt2$weight) # min weight for trt2 is 4.92

# Part 4: Generate a plot that shows the number of weight observations
#for each group.

plot(table(PlantGrowth$group) ,xlab= "Groups", ylab= "Number of weight observations")

# Part 5: Generate a boxplot of group vs. weight. The boxplot title must be 
#"PlantGrowth Data". The horizontal axis label must be "Group". The vertical 
#axis label must be "Dried weight of plants".
plot(PlantGrowth$group,PlantGrowth$weight, main = "PlantGrowth Data", xlab = "Group", ylab= "Dried weight of plants")

#Problem 2
# Part 1:R has a group of built-in datasets for US state data. Run ?state 
#in the R console to see which datasets exist.

?state

# Part 2:Use the built-in state.abb, state.area, and state.regions vectors to 
#create a data frame called st_area_region, which will contain the 50 
#state abbreviations and their associated areas (square miles) and regions.
st_area_region <- data.frame('ST' = state.abb, 'Area' = state.area, 'Region' = state.region)
st_area_region
# Part 3: What is the sum of the 50 state areas in square miles? Use the data
#in the st_area_region data frame, not in state.area.
sum(st_area_region[['Area']]) #The sum is 3618399 square miles

# Part 4: Which state has the largest area? the smallest area? 
#Use the data in the st_area_region data frame, not in state.area.
sorted_state_area <- st_area_region[order(state.area,decreasing=TRUE),]
sorted_state_area[1,1] #AK (Alaska) has the largest area
sorted_state_area[50,1] #RI (Rhode Island) has the smallest area

# Part 5: Generate a plot that shows the number of states in each of the four
#regions. The y axis should be labeled "Number of states per region".
plot(table(st_area_region$Region), xlab= "Regions", ylab="Number of states per region") 

# Part 6: What are the total areas of each of the four regions?
south <- st_area_region[st_area_region$Region=='South',]
print(sum(south$Area)) #area of South is 899556

west <- st_area_region[st_area_region$Region=='West',]
print(sum(west$Area)) #area of West is 1783960

northeast <- st_area_region[st_area_region$Region=='Northeast',]
print(sum(northeast$Area)) #area of Northeast is 169353

northCentral <- st_area_region[st_area_region$Region=='North Central',]
print(sum(northCentral$Area)) #area of North Central is 765530

#Problem 3
#Write and test the function rand_bw() that returns one random 
#integer in a specified range of integers. The function would be 
#called as follows:
rand_bw <- function(low, high) {
  chosenNum <- sample(low:high, 1)
  return(chosenNum)
}
rand_bw(1, 6)				# return an integer between 1 and 6
rand_bw(0, 1)				# return an integer between 0 and 1
rand_bw(19, 0)			# return an integer between 19 and 0
rand_bw(low = 1, high = 20)	# return an integer between 1 and 20
rand_bw(hi = 1, lo = 20)		# return an integer between 1 and 20
# All of the above are valid ways to call rand_bw.

#Problem 4:
#Write and test the function pypr() that accepts a vector as input and 
#returns a string that represents the vector in square-bracketed form
#(like Python). The function would be used as follows:

pypr <- function(vector1) {
  theString <- paste(vector1,collapse=',')
  theString <- paste('[', theString,sep='')
  theString <- paste(theString, ']',sep='')
  return(theString)
}

mystrvec <- c('a', 'b', 'c', 'd')
mystrvec
#[1] "a" "b" "c" "d"


# call the pypr function
pypr(mystrvec)


# output
#[1] "[a,b,c,d]"




myintvec <- c(4, 3, 2, 1)
myintvec
#[1] 4 3 2 1


# call the pypr function
pypr(myintvec)


# output
#[1] "[4,3,2,1]"

  

