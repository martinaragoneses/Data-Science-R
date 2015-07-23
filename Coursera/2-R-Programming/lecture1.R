#### Lecture 1 + swirl("R Programming")

getwd()
dir.create("lecture_1")
setwd("lecture_1")
file.create("mytest.R")
file.rename("mytest.R", "lecture_1.R")
file.remove('lecture_1.R')
list.files()
dir.create(file.path("testdir2", 'testdir3'), recursive = TRUE)
unlink("testdir2", recursive = TRUE)


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
  # read.table, read.csv (tabular data)
  # readLines (reading lines of a text file)
  # source (reading R code files)

# Main: read.table... arguments:
  # file, header (indicating the file has a header line, var names), 
  # sep (string indicating how the columns are separated), 
  # colClasses (character vector), nrows, comment.char, 
  # skip (number of lines to skip at the beginning)

# e.g. data <- read.table("foo.txt")

# If there is no comment lines in your data file, 
# always set comment.char = ""
# if all the columns are numeric: colClasses = "numeric"
# read a portion: initial <- read.table("text.txt", nrows = 100)
# looop: classes <- sapply(initial, class) # the function class figures out the class
# tabAll <- read.table(text.txt, colClasses = classes, comment.char = "", nrows = 1000)
#
# 
# dput is useful to save all the meta data of any R object
y <- data.frame(a = 1, b = "a")
dput(y) 
# dput(y, file = "y.R")
# new.y <- dget("y.R")
# dump can also be used

# "file" opens connection with file
# "url" opens connection with URL/webpage

# If we just wanted to read the first 10 lines
# con <- file("words.tx)
# x <- readLines(con, 10)
# x

# con <- url("http://www.something.com", "r")
# x <- readLines(con)
#
#
my_seq <-seq(5,10, length = 30)
seq(along.with = my_seq)
# same as
seq_along(my_seq)
rep(0, times = 40)
rep(c(0, 1, 2), times =10)
rep(c(0,1,2), each = 10)
#
#
my_char <- c('My', 'name', 'is')
paste(my_char, collapse = " ")
paste("Hello", "world!", sep = " ")

y <- rnorm(1000)
z <- rep(NA, 1000)
# let's select 100 elements at random from these 2000
# values (combining y and z) such that we don't know how many NAs
# we'll wind up with or what positions they'll occupy in our final
# vector
my_data <- sample(c(y,z), 100)
my_na <- is.na(my_data)
sum(my_na) # TRUE =1, FALSE =0

x <-  rnorm(100)
x[1:10]
x[c(3, 5, 7)]
x[c(-2, -10)] # except
x[-c(2, 10)] # same
x[!is.na(x)]
x[x>0]
x[!is.na(x) & x > 0 ] # Get a vector of elements in x
                      # that are both non-missing and positive
vect <- c(foo = 11, bar = 2, norf = NA)
names(vect)
vect2 <- c(11, 2, NA)
identical(vect, vect2)
vect["bar"]

my_vector <- 1:20
dim(my_vector) <- c(4,5)
my_vector
my_matrix <- matrix(1:20,   nrow = 4, ncol = 5)
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)

# Solution: data frames!
my_data <- data.frame(patients, my_matrix)
my_data

cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames

ints <- sample(10)
# To return the indices of the elements that are true:
which(ints>7)
any(ints < 0) # FALSE
all(ints>0) # TRUE

### FUNCTIONS

paste (..., sep = " ", collapse = NULL)

# name_funct <- function(x) {
  #wlkdlsdkmlwkdm
#}
ls() # Lists the variables in your workspace
class(data) # "data.frame"     (default with read.csv(), read.table())
dim(data)
nrow(plants) # number of obs
ncol(plants)
object.size(plants)
# character vector of column (i.e. variable) names
names(plants)
head(data) # function allows you to preview the top of the dataset
head(data, 10) # dafault 6
tail(data, 15)
summary(plants)

# how many times each value actually occurs in the data for a variable 
table(data$Var_Name).
# Understanding the structure
str(data)
viewinfo(data)


# Looping: lapply() and sapply(): Split-Apply-Combine strategy for data analysis
#SPLIT up some data into smaller pieces, APPLY a function to each piece, then COMBINE the results
# http://archive.ics.uci.edu/ml/datasets/Flags

#lapply() takes a list as an input applies a function to each element of the list, then returns a list of the same length
cls_list <- lapply(flags, class)
#since every element of the list returned by lapply() is a character vector of length one: simplified to a
#character vector. To do this manually 
as.character(cls_list) # returns a list
# sapply() allows you to automate this process by calling lapply() behind the scenes (s = simplify)
sapply(flags, class) # returns a vector
# if the result is a list where every element is of length one, then sapply() returns a vector.
# If the result is a list where every element is a vector of the same length (> 1), sapply() returns a matrix
#Orange is a dummy: to count the number of countries with Orange = 1 summ all elements in the column
sum(flags$orange)
flag_colors <- flags[, 11:17] #  subsetting command tells R that we want all rows, but only columns 11 through 17.)
lapply(flag_colors, sum)
sapply(flag_colors, sum)
# To get proportions
sapply(flag_colors, mean)
shape_mat <- sapply(flag_shapes, range)
unique_vals <- lapply(flags, unique)
sapply(unique_vals, length)
#list containing the second item from each element of the unique_vals list
lapply(unique_vals, function(elem) elem[2])

# vapply() and tapply()
# sapply() tries to 'guess' the correct format of the result
# vapply() allows you to specify it explicitly
# If the result
#doesn't match the format you specify, vapply() will throw an error, causing the operation to stop.
vapply(flags, unique, numeric(1)) #numeric vector of length 1... error... ok()
vapply(flags, class, character(1))
# same as  sapply(flags, class)
table(flags$landmass)
#tapply(): split your data up into groups based on the value of some variable, then apply a function to the members of each group.

#tapply() is like the by: command in STATA
tapply(flags$animate, flags$landmass, mean)
# to apply the mean function to the 'animate' variable separately for each of the six landmass groups
# giving us the proportion of flags containing an animate image WITHIN each landmass group.

# summary of population values (in round millions) for countries with and without the color red on their flag 

# Simulation:

# generate random numbers is sample()
# rolling four six-sided dice
sample(1:6, 4, replace = TRUE)
# 10 numbers between 1 and 20, WITHOUT replacement
sample(1:20, 10) # no number can appear more than once in the output
# permute all 26 letters of the English alphabet.
sample(LETTERS)
# size argument to sample() is not specified, R takes a sample equal in size to the vector
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
sum(flips)
# is the same as
rbinom(1, size = 100, prob = 0.7)
flips2 <- rbinom(100, size = 1, prob = 0.7)
rnorm(10, mean = 100, sd = 25) #default 0, 1r

rpois(5, 10)
replicate(100, rpois(5, 10))

cm <- colMeans(my_pois)
hist(cm)


# Time and Date
d1 <- Sys.Date()
d2 <- as.Date("1969-01-01")

t1 <- Sys.time()
t2 <- as.POSIXlt(Sys.time())
t2$min

# the dates and times in a dataset will be in a format that R does not recognize.
# strptime() converts character vectors to POSIXlt
t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")

# http://varianceexplained.org/r/teach_ggplot2_to_beginners/


# Graphics:
data(cars)
plot(cars)
# more explicitly
plot(x = cars$speed, y = cars$dist)
plot(cars$speed, cars$dist)

plot(dist ~ speed, cars)
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance", xlab = "Speed", sub = "My Plot Subtitle", main = "My Plot")
plot(cars, main = "My Plot")
?par # Graphical Parameters
plot(cars, col = 2) #red
plot(cars, xlim = c(10, 15))
?points 
plot(cars, pch = 2) # trianges
data(mtcars) # loads the data
data.frame(mtcars) # Shows the data frame
boxplot(formula= mpg ~ cyl, data = mtcars)

# Subsetting
x <- list(foo = 1:4, bar = 0.6)
x[1] # I get a list that contains a sequence
x[[1]] # I just get the sequence
x$bar 
#same as 
x[["bar"]]

# If you want to extract multiple elements of a list:
# You can only use [ ]
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)] 

# Difference between $ and [[]]
name <- "foo" 
x[[name]] # 1 2 3 4
x$name #NULL
x$foo # 1 2 3 4

# [[]] is also useful with double layered lists
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1,3)]] # 14
# same as
x[[1]][[3]]

x[[c(2, 1)]] # 3.14

# matrices
x <- matrix(1:6, 2, 3)
x[1, 2]
x[1, ] # you get a vertor back, to get a matrix, set drop = FALSE


# Removing missing (NA) values:
# You create a logical vector that tells you where the 
# NAs are, and then you can remove them by subsetting
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad] # 1 2 4 5

# Given two vectors of the same length,
# I use complete.cases() to return bor the element that's not missing in both
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")

good <- complete.cases(x, y)

good # TRUE TRUE FALSE TRUE FALSE TRUE
x[good] # 1 2 4 5
y[good] # "a" "b" "d" "f" 

# Missing values from data frames:
airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]
# takes out individuals with missing values (take out rows)


# Vectorized operations:
# * element by element multiplication
# %*% true matriz multiplication

