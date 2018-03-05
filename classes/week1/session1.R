# Comments: any line that begins with the Hash/Pound sign will be ignored by the interpreter, it is
# used as a way to keep notes right next to your code for both you and other people to read.
# Comment notes will be used here to help explain basic outlines of what we are doing and for future
# homework assignments.


# Data Types ---------------------------------------------------------------------------------------

# Numeric: numbers in general, both integers and decimals
23
str(23)
class(23)

3.99
str(3.99)
class(3.99)


# Character: a collection of letters and other alpha-numeric characters that make up words.
"Hello"
str("Hello")
class("Hello")

"123 Fake Str."
"Good Morning, my name is HAL. Are you Dave?"
"@"


# Logical: boolean true/false values, can only have these two states
TRUE
str(TRUE)
class(TRUE)

FALSE
T
F


# NA: a special kind of logical value that denotes the abscence of any data in a logical context.
NA
str(NA)
class(NA)
is.na(NA)

# NA can also be used to denote the abscence of a value elsewhere for any data type
class(as.numeric(NA))
class(as.character(NA))


# NULL: a more general type of value that denotes the abscence of a value without context
NULL
str(NULL)
class(NULL)
is.null(NULL)
is.na(NULL)



# Variable Binding ---------------------------------------------------------------------------------

# Bind: attach a value to named part of your memory space, check it out in the environment inspector
age <- 25
name <- "Frank"
male <- TRUE
num_ferraris <- NA

# Rebind: you can always overwrite a given value by binding a new one to it.
age <- 35
age <- "Orange"  # a rebind can even change the data type, so make sure it makes sense



# Collection Types ---------------------------------------------------------------------------------

# Vector: an ordered list of elements that all must be the same data type
c(1, 2, 3, 4, 5)
c("Hello", "World", "my", "name", "is", "Jimmy")
c(TRUE, FALSE, TRUE, TRUE, NA, FALSE)
c("Hello", 17, TRUE, NA)


# Once any value is bound to a variable, we can use that variable in its place for anything.
words <- c("Hello", "World", "my", "name", "is", "Jimmy")
str(words)
class(words)
length(words)
sort(words)
toupper(words)
tolower(words)
nchar(words)


nums <- c(103.5, 23.2, 17, 59.9, 43, 20, 20, 46, 39, 20, 77.34)
sum(nums)
mean(nums)
median(nums)
max(nums)
min(nums)
log(nums)
exp(nums)
var(nums)
sd(nums)
quantile(nums)
table(nums)
rank(nums)


# Manage Environment: even though we can see the environmetn inspector, we can manage it with code.
ls()
vars_used <- ls()
length(vars_used)
rm(words)
rm(list = ls())


