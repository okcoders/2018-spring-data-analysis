# CRAN & Loading Libraries -------------------------------------------------------------------------

# Library: a collection of R code that someone else has written that we can use ourselves.
library(dplyr)

# If you haven't installed a given library , you will likely get an error much like:
# Error in library(dplyr) : there is no package called ‘dplyr’

# Install a package right inside of R by running: (notice the name is quoted when installing)
install.packages("dplyr")

# A package will only need to be installed once, and then it can be loaded to be used with that
# library function.

library(dplyr)

# CRAN (Comprehensive R Archive Network): an online network that hosts R packages that you can
# download to use in your projects. When you install a package, it makes that package's 
# documentation available as well. Try searching for "dplyr" in the help menu now.

# Finding Packages
# The easisest way to find packages is to Google "CRAN" plus a keyword description of what you want
# to do. So if you wanted to do time series analysis a Google search for "CRAN time series" yields
# package called "timeSeries" that is likely a good place to start.


# dplyr --------------------------------------------------------------------------------------------

data()  # Get a list and descriptions of the built-in datasets R has available
data("mtcars")
head(mtcars)

# Table DataFrame: a special type of DF in dplyr that gives us some neat meta-funtionality
mtcars
tbl_df(mtcars)  # Instead of printing the whole thing, it prints 10 rows with helpful extras.


# Filter: reduce the amount of data by carrying out a filtering function
six_cyl <- filter(mtcars, cyl == 6)
head(six_cyl)

# Notice that we no only have to specify the name of the column in the filter logic.
sec17_cars <- filter(mtcars, qsec <= 17.0)
combined <- filter(mtcars, cyl == 6 & qsec <= 17.0)


# arrange: reorder the data according to some value in it
ordered <- arrange(mtcars, hp)
head(ordered)
reordered <- arrange(mtcars, desc(hp))
head(reordered)

# Since the output of a dplyr function is another dataframe, we can stack them up to get more
# complex functionality that steps through some operations on data.

four_cyl <- filter(mtcars, cyl == 4)
four_cyl_hp <- arrange(four_cyl, desc(hp))
head(four_cyl_hp)

# However, having to specify a new variable name at each step is going to get annoying.

# pipeline operator ( %>% ): a special operator that carries the result from one function to the
# next, and automatically puts it in as the first parameter.

four_cyl_hp <- mtcars %>%
  filter(cyl == 4) %>%
  arrange(desc(hp))

# This gives us a much cleaner way to express a pipeline of analytical operations on the data.

mtcars %>%
  tbl_df() %>%
  filter(cyl >= 6) %>%
  arrange(mpg) %>%
  filter(gear == 5)

large_gears <- mtcars %>%
  tbl_df() %>%
  filter(cyl >= 6) %>%
  arrange(mpg) %>%
  filter(gear == 5)

# Notice that when you run dplyr code without assigning it to a variable, it shows you a preview
# of the first few lines in the console without having to call head(). This is a good way to 
# iteratively build analytical pipelines and see how they work along the way.


# select: pick out a few specific columns in a specific order.

tbl_df(mtcars) %>%
  select(hp, gear, wt, mpg)

tbl_df(mtcars) %>%
  filter(disp > 275) %>%
  select(mpg, cyl, qsec) %>%
  arrange(qsec)

# This one will produce an error, because the 'disp' column is no longer in the data when
# the arrange function goes to use it to order the data. Make sure your operations are in the order
# that lets you accomplish what you want as your break down the problem.
tbl_df(mtcars) %>%
  filter(disp > 275) %>%
  select(mpg, cyl, qsec) %>%
  arrange(disp)

tbl_df(mtcars) %>%
  filter(disp > 275) %>%
  arrange(disp) %>%
  select(mpg, cyl, qsec)


# mutate: create a new column based on some aspect of the existing data

tbl_df(mtcars) %>%
  select(hp, cyl, mpg) %>%
  mutate(hp_cyl = hp / cyl) %>%
  arrange(desc(hp_cyl))

tbl_df(mtcars) %>%
  mutate(hpsq = hp ^ 2, half_cyl = cyl / 2)

tbl_df(mtcars) %>%
  select(hp, cyl, mpg) %>%
  mutate(hp_cyl = hp / cyl) %>%
  filter(hp_cyl > 25) %>%
  filter(hp_cyl < 30)

# between: a small logic function that makes window filtering a little more intuitive

tbl_df(mtcars) %>%
  select(hp, cyl, mpg) %>%
  mutate(hp_cyl = hp / cyl) %>%
  filter(between(hp_cyl, 25, 30))

# count: a simple function that will count the number of records in a dataframe.
tbl_df(mtcars) %>%
  count()

tbl_df(mtcars) %>%
  filter(disp > 275) %>%
  count()


