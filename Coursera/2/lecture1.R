#### Lecture 1

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
