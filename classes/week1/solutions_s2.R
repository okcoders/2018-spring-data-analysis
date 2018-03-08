# In-Class Exercises


# Factors ------------------------------------------------------------------------------------------

colors <- c("blue", "green", "blue", "red", "red", "orange", NA, "red", "blue")

# How many total elements are there to the colors vector?
length(colors)

# Turn colors into a factor and print the structure to see how many levels it contains.
colors <- as.factor(colors)
str(colors)


# Indexing -----------------------------------------------------------------------------------------

data <- c(103, 44, 11, 14, 65, NA, 44, 17, 44, 99, -4, -209)

# Add together the 3rd element and the 7th element of the data.
data[3] + data[7]
sum(data[c(3,7)])

# Subset the data to include only values that are greater than 29.
data[data > 29]

# Make a new version of the data where the NA value no longer exists.
data <- data[!is.na(data)]

# Give me the sum of the 5th to 9th values of the data
sum(data[5:9])


# Combining Functions ------------------------------------------------------------------------------

# How many values in the data are less than 51
length(data[data < 51])
sum(data < 51)

# Multiply all values in the data less than 25 by 99, and get the sum.
sum(data[data < 25] * 99)

# What is the sum of the natural logs of all values in the data equal to or greater than the median?
sum(log(data[data >= median(data)]))

# What percentage of the data is lower than the average?
lower <- data[data > mean(data)]
length(lower) / length(data)
