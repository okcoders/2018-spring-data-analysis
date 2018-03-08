# Comments: any line that begins with the Hash/Pound sign will be ignored by the interpreter, it is
# used as a way to keep notes right next to your code for both you and other people to read.


# Factors: character vectors that store a preset list of valid values

a <- c("blue", "green", "blue", "red", "red", "orange", NA, "red")
a <- as.factor(a)
class(a)

b <- c(12, 34, 12, 45, 33, 12, 12.1, 107)
b <- as.factor(b)


# Conditionals: operations that evaluate a condition rather than perform a math function

12 > 3
12 < 3
12 <= 13
12 <= 12
12 == 13
12 == 12
12 != 13

is.na(12)
is.na(NA)


# Because everything is vectorized, these work exactly the same way on collections

nums <- c(14, 103, 5, -4)
nums > 25
nums == 103
nums <= 14
is.na(nums)

nums <- c(14, 103, 5, -4, NA)
is.na(nums)

# Test for inclusion
14 %in% nums
99 %in% nums
NA %in% nums

data <- c(103, NA, 44, 11, 14)
data %in% nums


# Indexing: vectors are ordered lists of elements, and we can get at those elements by their order

data <- c(103, NA, 44, 11, 14)
data
data[1]
data[4]
data[-4]
data[1:3]
data[-(3:5)]
data[c(2, 1, 4)]
data[3:1]

data < 25
data[data < 25]
data[data > 25]
data[is.na(data)]
data[!is.na(data)]


# Matrix: a matrix is like a vector, but with 2 dimensions (rows & columns)

c(1:12)
matt <- matrix(c(1:12), nrow = 3, ncol = 4)
matt

matt[2,3]
matt[2,]
matt[,3]

matt > 4

length(matt)
ncol(matt)
nrow(matt)
dim(matt)
t(matt)

tim <- matrix(c(8:-3), nrow = 3, ncol = 4)
matt * tim
matt %*% tim


# Combining Functions: using multiple functions in the right order will start to give us higher
# levels of functionality, letting us solve larger problems.

data <- c(103, 44, 11, 14, 65, 44, 17, 44, 99, -4, -209)
length(data)
unique(data)
length(unique(data))
data[data > 50]
mean(data)
data[data < mean(data)]

# Try multiple values for key
key <- 48
length(data[data > key])
length(data)
length(data[data > key]) / length(data)

