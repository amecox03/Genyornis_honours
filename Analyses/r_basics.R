# ******************************************************************************

###                     Rex and Sof's Salinity Workshop                      ###

# ******************************************************************************

# ******************************************************************************

# Introduction to R -------------------------------------------------------

# ******************************************************************************

# First thing's first. The hash symbol '#' is known as the 'commenting symbol'.
# It is used to make notes that are not recognized as code by the software.


# For every analysis, you should begin a new R script and save it to a file that
# contains your data. This means that when you import and save files and images,
# they will all be contained within the same folder.


### Basic syntax ###

# R can be used as a calculator, similar to excel.
# '+' is plus
# '-' is minus
# '/' is division
# '*' is multiplication
# '^' is exponent
# 'sqrt' is the square root
# There's others too, some of which we'll get to in these sessions.

# Example:
1+1
2^2
sqrt(4)
# Notice the solution is presented in the Console panel below.


### The arrow '<-' is called the 'Assignment Operator' in R ###
# It is used to assign information to an object.

# You can name the object anything you like.
dirty_socks <- 2+2
# Notice that the object appears in the Environment window (top right).

# If you type the object alone, the information it contains is presented in the 
# console, in this case a vector with a single value.
dirty_socks

# You can then call upon that allocated information in further 
# calculations/analyses
dirty_socks*15
# Notice that an answer of 60 is printed in the console.
# In theory, this could continue ad infinitum. I could allocate the above line 
# to a new object:
clean_shoes <- dirty_socks*15
# And now the environment contains this object as well for future use.

# This can dramatically shorten coding for later usage

### TWO NOTES ON THIS ###
# 1) R is case-sensitive! Be careful!
# 2) No spaces allowed in object names between words. Instead use '_' or '.'
#### In out lab, we use '_' for objects and '.' for functions!!!

### Functions ###

# A function is a piece of code written to carry out a specified task.
# They are made for our convenience by other researchers. 
# Bless their cotton socks :D

# These functions are stored in packages


### Packages ###

# Some are automatically loaded when you start R. For example, 'stats'
# To view a package's contents:
library(help = "stats")
# This will open a new window listing all of the details of the package.
# This should include the authors for citations and all functions to search.
# When you find a function that you wish to use, you can search that function
# in the help box (bottom right window, 4th tab) and see exactly how to use it.
# Alternatively, type '?' followed by the function.
# For example, lets look at the function for a linear model, 'lm'
?lm

# Two other types of packages:
# 1) Base packages: installed with R but are not automatically loaded to save 
# memory. (see list in bottom right window, 3rd tab)
# 2) Contributed packages: created by external parties. Must be installed and 
# loaded. For example, 'geomorph' is specifically tailored for Geometric 
# Morphometrics. This must be installed.

# Three places to find them:
# 1)	Search in the packages window (click install and type the package name)
# 2)	CRAN: comprehensive R archive network. Go to https://cran.r-project.org/
# 3)	GitHub: https://github.com/trending/r


### Data Formats (see reference image) ###

## A vector ##

# A vector: 1 or more numbers in a 1-dimensional row of all the same data type
# Lets make a vector of numbers 1 through 18. 
# We'll name it after the Vesper martini - a delicious cocktail that was created 
# by Ian Fleming for James Bond in the original Casino Royale novel ;)
vesper <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)
# The 'c' stands for concatenate or combine. It creates a temporary list for
# assignment.
# Notice that 'vesper' has appeared in the environment to the right.
# If you run the object as code, the vector will be presented in the console.
vesper
# Instead of writing all numbers, you can shorten this by just separating the 
# maximum and minimum values by a colon ':'
vesper2 <- c(1:18)
vesper2
# (Note: the difference in the objects in the environment. One is class integer,
# the other is class numeric. This doesn't matter, as R automatically converts 
# between numeric classes.)
# In addition, if we wished to produce a vector with only numbers one through 
# six and ten through eighteen, we can do this easily:
vesper3 <- c(1:6,10:18)
vesper3
# This can be important for selecting specific data from a larger dataset.

## A matrix ##

# A matrix consists of rows and columns. A 2-dimensional array. 
# Requires the same length of rows and same data type.
# Let's make a matrix this time, using the same numbers, but divided into 3 rows.
# This time we use the 'matrix' function
?matrix
# We'll name this one after the Manhattan cocktail. 
# I had a Manhattan in Manhattan once - very nice :D
manhattan <- matrix(c(1:18), nrow=3)
manhattan
# Note that we can also do this with our vesper vector
manhattan2 <- matrix(vesper, nrow=3)
manhattan2
# Notice how the numbers have been distributed by columns? 
# We can switch this to distribute the numbers by rows if desired.
manhattan3 <- matrix(vesper, nrow=3, byrow=TRUE)
manhattan3
# 'TRUE' and 'FALSE' arguments in R are called 'logical' arguments.
# Both can usually be presented as 'T' and 'F' as well and almost never need 
# quotation marks unlike other arguments.

## A dataframe ##

# A dataframe is similar to a matrix, in that it consists of rows and columns. 
# The key difference is, that a dataframe can included data of different types. 
# we can use the as.data.frame function to turn our manhattan matrix into a dataframe
manhattan_df <- as.data.frame(manhattan)
# if we compare our manhattan matrix with our manhattan data frame, we can notice a few differences.
manhattan
manhattan_df
# we can then add a column of characters (called "new") to our manhattan_df
manhattan_df$new <- c('one', 'two', 'three')
# and we can rename one of our column headers
names(manhattan_df)[1] <- 'icePlease'
# check out our new dataframe:
str(manhattan_df) # shows us our column labels, our data types, and the first few data points.


## An array ##

# An array is a stack of matrices (layers), making it three-dimensional. 
# We aren't going to use arrays in this analysis, you just need to know that they 
# exist :)


# You can clear the environment with the following function:
rm(list = ls())
# Alternatively, click on the broom icon above the environment window. 
# The same icon is present in the console and Plots windows.


### Now lets look at some data!!! ###

# R has many stored datasets
# To view the list:
data()

# You can view the details of each dataset.
?iris # for example

# We can allocate this data to an object, so that it appears in the environment
data <- iris

# The data can be viewed either by clicking on the small table icon to the right
# of the object in the environment, or by run the object as code.
data

# The function 'head' produces the first six lines of the dataset.
head(iris) 

# The 'summary' function presents the main parameters of the data.
summary(iris) 
# prints number of individuals, variable means, sds, IQR, etc
# NOTE: the data is essentially a matrix by coordinates. SO we can extract any
# data via their coordinates, just like before!
# Data[1,2] will give us the first value of the second column (sepal width)
data[1,2]


### Now lets do some extracting! ###

# The dollar sign '$' is used to extract named elements from a named list. 
# You can use this to extract columns from a dataframe, which is what we will do 
# later down the track.

# For example, we can allocate the variable of sepal length to its own object:
sepalL <- data$Sepal.Length
sepalL 
# Sepal length is now a vector with 150 entries.

# Lets do this for all variables. It's not necessary, but it shortens lines of code.
sepalW <- data$Sepal.Width
petalL <- data$Petal.Length
petalW <- data$Petal.Width
species <- data$Species
# Note that species is qualitative
species
# So it is registered as a Factor with 150 observations across three levels.