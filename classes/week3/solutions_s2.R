# In-class Exercises


# Load the dplyr and jsonlite libraries
library(jsonlite)
library(dplyr)


# Load the Company Employees JSON file as a dplyr DataFrame, the same as the previous exercises.
emp <- tbl_df(fromJSON(txt = "company_employees.json"))


# NOTE: This is the same as the final problem as the prior session notes----------------------------
# Of all of the employees whose worth is more than 5% over their company's average, which one
# has the longest email address? Make the same output file of their first name, last name, and
# email address, but there is no need to write it out this time.

emp %>%
  filter(!is.na(total_worth)) %>%
  select(first_name, last_name, company, email, total_worth) %>%
  group_by(company) %>%
  mutate(mean_worth = mean(total_worth)) %>%
  ungroup() %>%
  mutate(pct_worth_diff = ((total_worth - mean_worth) / mean_worth)) %>%
  filter(pct_worth_diff > 0.05) %>%
  mutate(len_email = nchar(email)) %>%
  arrange(desc(len_email)) %>%
  select(first_name, last_name, email) %>%
  slice(1:25)


# Which female manager has a total worth the highest above their respective total company average?
# Include only the first and last name, the company name, and the percent different as a translated
# value (i.e. 35% would be 35.0 instead of 0.35); but make the names of the headers be: First, Last,
# Organization, and PercentDiff.
emp %>%
  select(-c(id, email)) %>%
  filter(!is.na(total_worth) & !is.na(is_management)) %>%
  group_by(company) %>%
  mutate(company_mean_worth = mean(total_worth)) %>%
  ungroup() %>%
  filter(is_management & gender == "Female") %>%
  mutate(pct_worth_diff = ((total_worth - company_mean_worth) / company_mean_worth)) %>%
  arrange(desc(pct_worth_diff)) %>%
  select(first_name, last_name, company, pct_worth_diff) %>%
  rename(First = first_name,
         Last = last_name,
         Organization = company,
         PercentDiff = pct_worth_diff)


# Meat Data ----------------------------------------------------------------------------------------

# Go to the Link Below and download the CSV file ZIP package at the bottom.
# https://www.ers.usda.gov/data-products/livestock-and-meat-international-trade-data/livestock-and-meat-international-trade-data/#Zipped%20CSV%20files
# Load the LivestockMeat_Imports.csv dataset CSV as a dplyr dataframe and run a summary on it to 
# see what it looks like.

meat <- tbl_df(read.csv(file = "LivestockMeat_Imports.csv"))
summary(meat)


# For the countries of Canada, Poland, Denmark, and Ireland; in what year for each did Bacon
# represent the maximum percent of total imports into the US. Show only the Country, Year, and 
# PercentImports (with those column names) for each country only for the maximum year. Your
# output data should only be 4 rows long, and ordered alphabetically by the name of the Country.
meat %>%
  filter(GEOGRAPHY_DESC %in% c("Canada", "Poland", "Denmark", "Ireland")) %>%
  select(YEAR_ID, TIMEPERIOD_ID, GEOGRAPHY_DESC, COMMODITY_DESC, AMOUNT) %>%
  group_by(YEAR_ID, GEOGRAPHY_DESC, COMMODITY_DESC) %>%
  summarise(AMOUNT = sum(AMOUNT)) %>%
  ungroup() %>%
  group_by(YEAR_ID, GEOGRAPHY_DESC) %>%
  mutate(total_imports = sum(AMOUNT)) %>%
  ungroup() %>%
  mutate(pct_share = AMOUNT / total_imports) %>%
  filter(COMMODITY_DESC == "Bacon") %>%
  group_by(GEOGRAPHY_DESC) %>%
  mutate(max_share = max(pct_share)) %>%
  ungroup() %>%
  filter(pct_share == max_share) %>%
  select(GEOGRAPHY_DESC, YEAR_ID, pct_share) %>%
  rename(Country = GEOGRAPHY_DESC,
         Year = YEAR_ID, 
         PercentImports = pct_share) %>%
  arrange(Country)


# Exploratory Notes
unique(meat$YEAR_ID)
unique(meat$TIMEPERIOD_ID)

meat %>%
  filter(COMMODITY_DESC == "Bacon") %>%
  filter(GEOGRAPHY_DESC == "Canada") %>%
  arrange(desc(YEAR_ID), TIMEPERIOD_ID) %>%
  View(.)

  
