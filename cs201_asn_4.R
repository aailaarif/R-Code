# cs201_asn_4.R
# Aaila Arif, s1324028	
# CS-201						
# Spring 2023			

# Problem 1: Read 2020_2022_state_region_est_pop_change.csv into a data
#frame called state.pop. Examine state.pop with str(). Use the state.pop data 
#frame for the remainder of this assignment. Optional: Use attach() on 
#state.pop so that you can access the columns of state.pop without having to
#type state.pop$ in front of the column names.

state.pop <- read.csv("2020_2022_state_region_est_pop_change.csv")
str(state.pop)


# Problem 2:Write code to list the names of the states that decreased in
#population from 2020-2022, i.e., POPESTIMATE2022 - POPESTIMATE2020 < 0.

decrease <- state.pop[state.pop$POPESTIMATE2022-state.pop$POPESTIMATE2020<0,]
decrease$NAME

# Problem 3:Write code to output the name of the state that had the greatest
#increase in population from 2020-2022.

index <- which.max(state.pop$POPESTIMATE2022 - state.pop$POPESTIMATE2020)
max_state <- state.pop$NAME[index]
cat("The state that had the greatest increase in population from 2020 to 2022 is", max_state, "\n")
max_state

# Problem 4:Write code to output the name of the state that had the 
#greatest decrease in population from 2020-2022.

index <- which.min(state.pop$POPESTIMATE2022 - state.pop$POPESTIMATE2020)
min_state <- state.pop$NAME[index]
cat("The state that had the greatest decrease in population from 2020 to 2022 is", min_state, "\n")
min_state

# Problem 5: Write code to output the name of the region that had the greatest
#increase in population from 2020-2022.
south <- state.pop[state.pop$REGION == "South",]
west <- state.pop[state.pop$REGION == "West",]
midwest <- state.pop[state.pop$REGION == "Midwest",]
northeast <- state.pop[state.pop$REGION == "Northeast",]

sDiff <- sum(south$POPESTIMATE2022) - sum(south$POPESTIMATE2020)
wDiff <- sum(west$POPESTIMATE2022) - sum(west$POPESTIMATE2020)
mDiff <- sum(midwest$POPESTIMATE2022) - sum(midwest$POPESTIMATE2020)
nDiff <- sum(northeast$POPESTIMATE2022) - sum(northeast$POPESTIMATE2020)

if(sDiff > wDiff && sDiff > mDiff && sDiff > nDiff){
  print("The region that had the greatest increase in population from 2020 to 2022 is South")
}else if(wDiff > sDiff && wDiff > mDiff && wDiff > nDiff){
  print("The region that had the greatest increase in population from 2020 to 2022 is West")
}else if(mDiff > sDiff && mDiff > wDiff && mDiff > nDiff){
  print("The region that had the greatest increase in population from 2020 to 2022 is Midwest")
}else{
  print("The region that had the greatest increase in population from 2020 to 2022 is Northeast")
}



# Problem 6: Write code to output the name of the region that had the greatest 
#decrease in population from 2020-2022.

if(sDiff < wDiff && sDiff < mDiff && sDiff < nDiff){
  print("The region that had the greatest decrease in population from 2020 to 2022 is South")
}else if(wDiff < sDiff && wDiff < mDiff && wDiff < nDiff){
  print("The region that had the greatest decrease in population from 2020 to 2022 is West")
}else if(mDiff < sDiff && mDiff < wDiff && mDiff < nDiff){
  print("The region that had the greatest decrease in population from 2020 to 2022 is Midwest")
}else{
  print("The region that had the greatest decrease in population from 2020 to 2022 is Northeast")
}

# Problem 7: Create a vector called pct.pop.change that contains the population
#change as a percentage of population, i.e., (POPESTIMATE2022 - POPESTIMATE2020)
# * 100 / POPESTIMATE2020.

pct.pop.change <- (state.pop$POPESTIMATE2022 - state.pop$POPESTIMATE2020) * 100 / state.pop$POPESTIMATE2020

# Problem 8: Add the pct.pop.change vector as a new column in the state.pop data frame like this:
#state.pop$PCTPOPCHG <- pct.pop.change
#The new column name will be PCTPOPCHG.

state.pop$PCTPOPCHG <- pct.pop.change

# Problem 9: Write code to output the name of the state that had the greatest
#percentage increase in population from 2020-2022.

index <- which.max(state.pop$PCTPOPCHG)
max_pct_increase <- state.pop$NAME[index]
cat("The state that had the greatest percentage increase in population from 2020 to 2022 is", max_pct_increase, "\n")
max_pct_increase

# Problem 10: Write code to output the name of the state that had the greatest
#percentage decrease in population from 2020-2022.

index <- which.min(state.pop$PCTPOPCHG)
max_pct_decrease <- state.pop$NAME[index]
cat("The state that had the greatest percentage decrease in population from 2020 to 2022 is", max_pct_decrease, "\n")
max_pct_decrease

# Problem 11: Write code to write a new CSV file pop_change_rev.csv from 
#state.pop. When writing to the CSV file, use the row.names=FALSE option. 
#Dropbox pop_change_rev.csv along with cs201_asn_5.R.

write.csv(state.pop,file = "pop_change_rev.csv", row.names=FALSE)
