# Step 1: Data -------------------------------------------------------------------------------------

# For the first project,we are going to be exploring some traffic violation data from all Traffic
# Violations issued in Montgomery County Maryland. You can read more about the data here:
# https://catalog.data.gov/dataset/traffic-violations-56dda

# The full dataset is pretty big with ~1.26 million rows. Once uncompressed it is about 460MB in
# size, which for some machines may be a pretty heavy workload of data. If you would like to tackle
# using the entire dataset, please use this link to get the compressed version of the CSV.
# https://www.dropbox.com/s/76b873tivk90hid/Traffic_Violations.csv.zip?dl=0

# For those that wannt a slightly easier dataset to work with, there is a version of the data that
# is restrcited entirely to the Bethesda part of the county--which is composed of ~190K records, 
# and when uncompressed is only about 80MB of data space. If you would prefer to use this:
# https://www.dropbox.com/s/ru2870jq32aqopy/Traffic_Violations_Bethesda.csv.zip?dl=0


# The first step of your analysis will be to get the dataset you will use, uncompress it, and then
# create a new file called eda.R. This will be the file where we weill do our Exploratory Analysis
# that will not go into our final code, but will keep a record of the exploration we did as a 
# personal reference. From this EDA file, please load the data into a dplyr DataFrame and explore
# around to get a feel for what is in the data. Use the meta-data resources as necessary on the first
# link to get a basic feel of the domain this data represents.


# Step 2: Answering Analytical Questions -----------------------------------------------------------


# Perform an analysis of all incidents where either a seatbelt was not worn or alcohol was a factor.
# Quantify which was more likely to result in a fatal incident.


# Of all fatal car crashes, determine if the year-to-year trend has any discernable pattern. Does
# it appear the rate is going up, down, erratic, or mostly unchanged? Is that trend any different
# for accidents that caused Personal Injury in general, and/or Property Damage?


# What hour of the day do the most non-fatal injuries not involving alchohol occur? What day of the
# week? Do those values change if we take into account whether the person driving has a commercial
# license or not? What if we factor out incidents that occur in work zones?

# Expanding on the prior question, quantify the frequency relationship for any given hour of the day
# compared to the overall daily rate of non-Personal Injury incidents.

# Are Commerical Vehicles more or less likely to be involved in incidence where HAZMAT is needed? 
# What about incidents that occur in Work Zones?


# What 5 states (not including Maryland) bring in the highest number of Citations as a share of that
# state's relative population? (Hint: you might need to go find more data to answer this).

