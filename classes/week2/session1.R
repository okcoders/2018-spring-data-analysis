# Compound Logic -----------------------------------------------------------------------------------

TRUE & TRUE
TRUE & FALSE

TRUE || FALSE
TRUE | FALSE

c(TRUE, TRUE) & c(FALSE, TRUE)

# Use for Slicing & Indexing
nums <- 1:10
nums[(nums > 3) & (nums <= 8)]
nums[(nums < 6) & (nums != 2)]

nums[(nums < 4) | (nums >= 9)]
nums[(nums == 4) | (nums >= 9)]


# Data Functions -----------------------------------------------------------------------------------

# Generating Data without having to type everything in by hand
c(1, 5, 9)
c(30:40)
seq(from = 5, to = 7, by = 0.15)
rep(1:3, times = 4)
rep(1:3, each = 4)


# Sample: getting random values from a pool of possibilities
sample(x = 1:25, size = 10)
sample(x = 1:5, size = 10)  # Produces an error, asked for more than the pool
sample(x = 1:5, size = 10, replace = TRUE)

pool <- c(12, 17, 99, -3)
sample(x = pool, size = 100, replace = TRUE)

pool <- seq(from = 0, to = 100, by = 0.01)
sample(x = pool, size = 500)


# Distributions: getting some data from a certain type of statistical distribution

# Seed: a seed lets each time we run the code come up with the same random numbers
set.seed(99) 

# Plotting: simple visual representation of data 
# (we will get into more powerful Data Visualization later)

plot(1:100)
plot(log(1:100))
plot(exp(1:100))

hist(1:100)
hist(sample(x = 1:5, size = 100, replace = TRUE))

# Uniform: all elements have an equal chance of getting picked--very similar to sample
runif(n = 25, min = 1, max = 10)
plot(runif(n = 100, min = 1, max = 10))
plot(runif(n = 10000, min = 1, max = 10))
hist(runif(n = 10000, min = 1, max = 10))

# Normal: bell-curve or Gaussian distribution
rnorm(n = 25, mean = 25, sd = 5)
plot(rnorm(n = 100, mean = 25, sd = 5))
plot(rnorm(n = 1000, mean = 25, sd = 5))
plot(rnorm(n = 10000, mean = 25, sd = 5))
hist(rnorm(n = 10000, mean = 25, sd = 5))

# Exponential: 
rexp(n = 25, rate = 1)
plot(rexp(n = 10000, rate = 1))
plot(rexp(n = 10000, rate = 100))
plot(rexp(n = 10000, rate = 0.1))
hist(rexp(n = 10000, rate = 1))

# Beta: distribution whose shape is controlled by parameters
rbeta(n = 25, shape1 = 0.5, shape2 = 0.5)
plot(rbeta(n = 10000, shape1 = 1, shape2 = 1))

plot(rbeta(n = 10000, shape1 = 0.1, shape2 = 100))
hist(rbeta(n = 10000, shape1 = 0.1, shape2 = 100))

plot(rbeta(n = 10000, shape1 = 100, shape2 = 0.1))
hist(rbeta(n = 10000, shape1 = 100, shape2 = 0.1))

plot(rbeta(n = 10000, shape1 = 0.5, shape2 = 0.5))
hist(rbeta(n = 10000, shape1 = 0.5, shape2 = 0.5))


# Data Frames --------------------------------------------------------------------------------------

df <- data.frame(name = c("Frank", "Bob", "Jack", "Mary", "Bill"),
                 age = c(29, 6, 49, 17, 55))

View(df)
head(df)

length(df)
ncol(df)
nrow(df)
dim(df)

# Slicing and Indexing the vectors
df[[1]]
df[[2]]
df$name
df$age

length(df$age[df$age > 25])

# Slicing and Indexing the whole DataFrame
df[1, 2]
df[2, ]
df[ , 1]


# Assigning new colunms
df$male
df$male <- c(TRUE, TRUE, TRUE, FALSE, TRUE)
head(df)

sum(df$age[df$male])

df$num <- rnorm(n = nrow(df), mean = 10, sd = 3)
head(df)

df[1:3, ]


# Built in Datasets --------------------------------------------------------------------------------

data(iris)

head(iris)
tail(iris)

plot(x = iris$Sepal.Length, y = iris$Sepal.Width)
plot(x = iris$Petal.Length, y = iris$Petal.Width)

plot(iris)

cor(x = iris$Sepal.Length, y = iris$Sepal.Width)
cor(x = iris$Petal.Length, y = iris$Petal.Width)

