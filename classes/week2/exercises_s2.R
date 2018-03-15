# CRAN & Finding Packages --------------------------------------------------------------------------

# Google "CRAN JSON" to find a package that might be good for working with JSON format data. Then
# install that library, look it up in the documentation, and run the first non-comment line of the
# examples and see what you get.



# dplyr --------------------------------------------------------------------------------------------
# Load and use the mtcars dataset for all of the following questions.
# Pro-tip: have the "data-transformation" cheat sheet pulled up, it will make your life easier.

# Show all cars that have a 3 speed gear box (gear).



# Make a version of mtcars where there is a new column added that shows the number of carburator
# barrels (carb) added to the number of gears, call the new column "gearcarbs".



# Are there more cars in the dataset that are Automatic Transmission (am: 0) or Manual
# Transmission (am:1)?



# Find the cars with better than 18.0 miles per gallon (mpg) where the displacement (disp) per
# cylinder (cyl) is more than 35. Show only the number of cylinders, the displacement per
# cylinder and the miles per gallon in that order, but order the rows of the data slowest to
# fastest by quarter mile time (qsec).



# Load the iris dataset. Build a DataFrame of only flowers where the Sepal Length is greater than
# the average but the Petal Width is less than the median. Show an output set where only the
# flower species and the total area of the Petal (pretend its a rectangle and just compute as
# length x width) are included, but order the output such that the largest Sepal Width flowers are
# first.
