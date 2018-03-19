library(dplyr)

# Loading Data from Files --------------------------------------------------------------------------


# Setting the working Directory: in order to tell R where to load things from we will need to set 
# a working directory. This can either be done from RStudio or with a command.

getwd()  # show you where you are right now
setwd("~/Dropbox/okcoders/inclass/")  # Sets the working directory to a certain folder.


# Most data is clean, and can be loaded without having to do a lot to clean things up.

emp <- read.csv(file = 'company_employees.csv')
head(emp)

names <- c("emp_id", "first", "last", "email", "mf", "org", "money_thing")
emp <- read.csv(file = 'company_employees.csv',
                header = TRUE,
                sep = ",",
                dec = ".",
                fill = TRUE,
                nrow = 25,
                col.names = names,
                stringsAsFactors = FALSE)


# Sometimes data can be a little bit messier, and you need to spend some time figuring out how to
# load it when it gets messier.

emp <- read.table(file = 'company_employees.csv',
                  header = FALSE,
                  sep = ",",
                  col.names = names,
                  blank.lines.skip = TRUE
                  )


clean <- tbl_df(read.csv(file = 'company_employees.csv')) %>%
  filter(!is.na(total_worth)) %>%
  filter(gender == "Female") %>%
  arrange(last_name)

# Just as we can read a file, we can write one back out.

write.csv(x = clean,
          file = 'clean_employees.csv')

write.table(x = clean,
            file = "clean_employees_eu.csv",
            sep = "|",
            dec = ",",
            quote = TRUE)

rm(list = ls())

# See if we can load back the file we wrote, makes a good check that we wrote a good file

loaded_clean <- read.table(file = "clean_employees_eu.csv")

head(loaded_clean)

loaded_clean <- read.table(file = "clean_employees_eu.csv",
                           header = TRUE,
                           sep = "|",
                           dec = ",")


# Loading JSON data --------------------------------------------------------------------------------

library(jsonlite)

# JSON: JavaScript Object Notation is a common method of data encoding that uses a very small subset
# of JavaScript data types to encode data. These data types are very similar to familiar types in R.
# The advantage of JSON is that it contains within itself the information about how the data should
# be structured and what data types each part is. We will be working with a very specific style of
# JSON that will encode tabular data like we have seen so far.


ex <- fromJSON(txt = "example.json")

emp <- tbl_df(fromJSON(txt = "company_employees.json"))


# Additional dplyr functions -----------------------------------------------------------------------

emp <- tbl_df(read.csv(file = 'company_employees.csv'))
summary(emp)

# Summarise: do a calculation over multiple values

emp %>%
  count()

emp %>%
  summarise(mean_worth = mean(total_worth, na.rm = TRUE),
            sum_worth = sum(total_worth, na.rm = TRUE))

# pretty much any function that can run on a vector can be used as a summary function
emp %>%
  filter(!is.na(total_worth)) %>%
  summarise(mean_worth = mean(total_worth),
            sigma_worth = sd(total_worth))


# Grouping: aggregating by some value in the underlying data before running a summary function

emp %>%
  filter(!is.na(total_worth)) %>%
  group_by(gender) %>%
  summarise(mean_worth = mean(total_worth))

emp %>%
  group_by(company) %>%
  summarise(sum_worth = sum(total_worth, na.rm = TRUE),
            n_people = n()) %>%
  filter(n_people > 1) %>%
  arrange(desc(n_people), company)

email_len_by_gender <- emp %>%
  mutate(email = as.character(email)) %>%
  mutate(len_email = nchar(email)) %>%
  group_by(gender) %>%
  summarise(n_people = n(),
            avg_email_len = mean(len_email),
            var_email_len = var(len_email)) %>%
  ungroup() %>%
  mutate(var_high = avg_email_len + var_email_len,
         var_low = avg_email_len - var_email_len)


# Joining: connecting one data set to another

emp %>%
  mutate(email = as.character(email)) %>%
  mutate(len_email = nchar(email)) %>%
  select(first_name, last_name, len_email, gender) %>%
  inner_join(y = email_len_by_gender, by = "gender")

emp %>%
  mutate(email = as.character(email)) %>%
  mutate(len_email = nchar(email)) %>%
  select(first_name, last_name, len_email, gender) %>%
  inner_join(y = email_len_by_gender, by = "gender") %>%
  mutate(dev_email_len = len_email - avg_email_len,
         idx_email = len_email / avg_email_len) %>%
  select(first_name, last_name, dev_email_len, idx_email) %>%
  arrange(desc(idx_email))



