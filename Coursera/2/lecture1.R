
x <- c(1:6) # vector

y <- list(1, "a", TRUE) # list

m <- matrix(nrow = 2, ncol = 3) # matrix
m <- matrix(1:6, nrow = 2, ncol = 3) # are created columnwise

m <- 1:10
dim(m) <- c(2,5)

#Column and Row binding
x <- 1:3
y <- 10:12

cbind(x,y)
rbind(x, y)

#  Factors (with labels) for categorical data
x <- factor(c("yes", "yes", "no", "yes"))
table(x) # gives frequency
# we want yes to be the baseline level
#levels = c("yes", "no")

# Missing values
x <- c(1, 2, NA, NaN, 10, 3)
is.na(x) 

# Data Frames:
  # created with data.frame()
 # row.names ==> individual identifiers/ observations
 # read.table() or read.csv()  # also used to create a data frame
 # can be converted to matrix w/ data.matrix()
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))   # first column is the foo variable
                                                  # second column is the bar varaible 
# To find the number of rows:
nrow(x)
ncol(x)
ncol(x)

#Names
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)

y <- list(a = 1, b = 2, c=3)

# Reading Data: 



