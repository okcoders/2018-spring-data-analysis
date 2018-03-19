# In-class Exercises


# Load the dplyr and jsonlite libraries
library(jsonlite)
library(dplyr)


# Load the Company Employees JSON file as a dplyr DataFrame, take a look at the summary and get an idea of it
emp <- tbl_df(fromJSON(txt = "company_employees.json"))
summary(emp)

# How many companies have more than 1 people?
emp %>%
  group_by(company) %>%
  summarise(n_people = n()) %>%
  ungroup() %>%
  filter(n_people > 1) %>%
  count()


# Of the companies that have 4 or more people, which company(ies) have the longest name?
emp %>%
  group_by(company) %>%
  summarise(n_people = n()) %>%
  ungroup() %>%
  filter(n_people >= 4) %>%
  mutate(char_company = nchar(company)) %>%
  arrange(desc(char_company))


# How many people are missing either a value for total worth or their management position? Which are
# there more of, men or women?
emp %>%
  filter(is.na(total_worth) | is.na(is_management)) %>%
  group_by(gender) %>%
  summarise(n_people = n()) %>%
  ungroup()


# Building on that, if a person is management, are they more or less likely to be missing their 
# total_worth value? (It is safe to filter out those we don't know if they are management or not).
# Hint: check out what happens if you run code - sum(c(FALSE, FALSE, TRUE, TRUE, FALSE))
emp %>%
  filter(!is.na(is_management)) %>%
  group_by(is_management) %>%
  mutate(missing_worth = is.na(total_worth)) %>%
  summarise(n_people = n(),
            num_missing = sum(missing_worth)) %>%
  mutate(pct_missing = (num_missing / n_people)) %>%
  arrange(desc(pct_missing))


# If we raised the total worth of everyone that was not management by 10%, who would see a larger
# increase in their worth, men or women? By how much? (It is safe to filter our anyone where we
# do not know their present worth and/or do not know if they are management or not).
# [Hint: check out the if_else() function in your documentation, it might be helpful.]
emp %>%
  select(id, gender, is_management, total_worth) %>%
  filter(!is.na(is_management) & !is.na(total_worth)) %>%
  mutate(raised_worth = if_else(is_management, total_worth, total_worth * 1.10)) %>%
  group_by(gender) %>%
  summarise(mean_original = mean(total_worth),
            mean_raised = mean(raised_worth)) %>%
  ungroup() %>%
  mutate(diff = mean_raised - mean_original) %>%
  arrange(desc(diff))


# Of all of the employees whose worth is more than 5% over their company's average, which one
# has the longest email address? Save a CSV of the top 25 as a pipe-delimited file with each person's
# worth in EU format. Only include their first name, last name, and email address in the output file.

company_mean_worth <- emp %>%
  filter(!is.na(total_worth)) %>%
  group_by(company) %>%
  summarise(mean_worth = mean(total_worth))

output <- emp %>%
  filter(!is.na(total_worth)) %>%
  select(first_name, last_name, company, email, total_worth) %>%
  inner_join(y = company_mean_worth, by = "company") %>%
  mutate(pct_worth_diff = ((total_worth - mean_worth) / mean_worth)) %>%
  filter(pct_worth_diff > 0.05) %>%
  mutate(len_email = nchar(email)) %>%
  arrange(desc(len_email)) %>%
  select(first_name, last_name, email) %>%
  slice(1:25)

write.table(x = output,
            file = "high_worth_employees.csv",
            sep = "|",
            dec = ",",
            quote = TRUE)

read.table(file = "high_worth_employees.csv",
           header = TRUE,
           sep = "|",
           dec = ",")


