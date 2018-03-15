# In-class Exercises: Week 2 Session 1

set.seed(101)


# Compound Logic -----------------------------------------------------------------------------------

nums <- c(1:25)


# What is the sum of the values in the nums greater than 11 but less than or equal to 19?
sum(nums[(nums > 11) & (nums <= 19)])

# What is the mean of all values that are either 22 or less than 8?
mean(nums[(nums == 22) | (nums < 8)])

# What is the standard deviation of values that are either less than or equal to 12 but not
# including 7?
sd(nums[(nums <= 12) & (nums != 7)])


# Distributions ------------------------------------------------------------------------------------

# Compute the sum of 329 random normally distributed values from a distribution with a mean
# of 10 and a standard deviation of 3.
sum(rnorm(n = 329, mean = 10, sd = 3))

# Plot a simple histogram of 2500 values drawn from a beta distribution with shape
# parameters of 0.9 and 3.1.
hist(rbeta(n = 2500, shape1 = 0.9, shape2 = 3.1))


# Data Frames --------------------------------------------------------------------------------------

# Load the built-in iris DataFrame so it can be used, and look at the last 6 rows.
data(iris)
tail(iris)

# How many rows and columns does the iris data set contain?
dim(iris)

# What are the unique values of the Species value?
unique(iris$Species)

# What is the average Sepal Length for flowers from the versicolor species?
mean(iris$Sepal.Length[iris$Species == "versicolor"])

# Add a new column to the data called "Sepal.Total" that is computed as the sum of the sepal
# length and width of each flower.
iris$Sepal.Total <- iris$Sepal.Length + iris$Sepal.Width

# What is the correlation of the new total sepal value to the width of each flower's petal?
cor(x = iris$Sepal.Total, y = iris$Petal.Width)

# Make a small multiples plot of all of the values in iris, including the new one you just added.
plot(iris)


