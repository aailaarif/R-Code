
# indexing_lab.R
# Aaila Arif, s1324028		
# CS-201							
# Spring 2023	

# "Positive" Indexing of Vectors
set.seed(33) # For reproducibility
x.vec <- rnorm(6) # Generate a vector of 6 standard normal variates
x.vec

x.vec[3] # Third element

x.vec[c(3,4,5)] # Third through fifth elements

x.vec[3:5] # Same, but written more succintly

x.vec[c(3,5,4)] # Third, fifth, then fourth element

# "Negative" Indexing of Vectors
x.vec[-3] # All but third element

x.vec[c(-3,-4,-5)] # All but third through fifth element

x.vec[-c(3,4,5)] # Same

x.vec[-(3:5)] # Same, more succint (note the parantheses!)

# Indexing Matrices

x.mat <- matrix(x.vec, 3, 2) # Fill a 3 x 2 matrix with
                             # the elements of x.vec,
                             # in column-major order
x.mat

x.mat[2,2] # Element in 2nd row, 2nd column

x.mat[5] #Same (note this is using column major order)

# More Matrix Indexing

x.mat[2,] # Second row

x.mat[1:2,] # First and second rows

x.mat[,1] # First column

x.mat[,-1] # All but first column

# Indexing Lists
# What does sample do here?
x.list <- list(x.vec, letters, 
               sample(c(TRUE,FALSE),
               size=4, replace=TRUE))
x.list

x.list[[3]] # Third element of list

x.list[3] # Third element of list, kept as a list

# Everything is Exactly the Same as Vector Indexing
x.list[1:2] # First and second elements of list (note the single brackets!)

x.list[-1] # All but first element of list

# But Be Careful
# This works.
x.list[[1]]

# This probably doesn't do what you expect:
x.list[[1:2]]

# Indexing with Booleans
x.vec[c(F,F,T,F,F,F)] # Third element

x.vec[c(T,T,F,T,T,T)] # All but third element

pos.vec <- x.vec > 0 # Boolean vector indicating whether each element is positive
pos.vec

x.vec[pos.vec] # Pull out only positive elements

x.vec[x.vec > 0] # Same, but more succint (this is done "on-the-fly")

# Indexing with Names
names(x.list) <- c("normals", "letters", "bools")
x.list[["letters"]] # "letters" (third) element

x.list$letters # Same, just using different notation

x.list[c("normals", "bools")]
