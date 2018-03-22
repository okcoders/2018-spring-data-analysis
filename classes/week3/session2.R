library(jsonlite)
library(dplyr)

# Additional dplyr functionality

emp <- tbl_df(fromJSON(txt = "company_employees.json"))

# Rename: change the name of a column without performing a function on it

emp %>%
  rename(mgmt_status = is_management)


# Access to the pipeline operator for non-dplyr functionality
emp %>%
  select(first_name, last_name, gender, total_worth) %>%
  filter(total_worth > 36) %>%
  arrange(last_name) %>%
  View(.)

emp %>%
  select(first_name, last_name, gender, total_worth) %>%
  mutate(gender = as.factor(gender)) %>%
  filter(total_worth > 36) %>%
  arrange(last_name) %>%
  summary(.)

# the dot (.) will reference the value that the pipeline operator (%>%) carries over.


# Windowing: computing aggregations without having to do the aggregating.

emp %>%
  select(first_name, last_name, gender, total_worth) %>%
  group_by(gender) %>%
  mutate(gender_avg = mean(total_worth, na.rm = TRUE))

# A window function is like doing an aggregation and then joining back to the result, but 
# without the headache of needing to do all that extra work. They are super useful for comparing
# individual records to computations made against larger parts of the data with fewer headaches.

emp %>%
  select(first_name, last_name, total_worth) %>%
  filter(!is.na(total_worth)) %>%
  group_by() %>%
  mutate(tw_sd1 = mean(total_worth) + sd(total_worth)) %>%
  ungroup() %>%
  filter(total_worth > tw_sd1) %>%
  mutate(pct_diff = (total_worth / tw_sd1) - 1.0) %>%
  arrange(desc(pct_diff))


emp %>%
  select(first_name, last_name, total_worth, is_management) %>%
  filter(!is.na(total_worth)) %>%
  group_by() %>%
  mutate(tw_sd1 = mean(total_worth) + sd(total_worth)) %>%
  ungroup() %>%
  filter(total_worth > tw_sd1) %>%
  mutate(pct_diff = (total_worth / tw_sd1) - 1.0) %>%
  group_by(is_management) %>%
  summarise(num_people = n(),
            mean_diff = mean(pct_diff),
            diff_hi = max(pct_diff))

# we can group by multiple items, and the results will be all the unique combinations
emp %>%
  filter(!is.na(total_worth)) %>%
  group_by(gender, is_management) %>%
  summarise(num_people = n(),
            mean_worth = mean(total_worth)) %>%
  ungroup() %>%
  group_by(gender) %>%
  mutate(n_people_gender = sum(num_people)) %>%
  ungroup() %>%
  mutate(pct_gender = (num_people / n_people_gender)) %>%
  select(-(n_people_gender))


emp %>%
  filter(!is.na(total_worth)) %>%
  select(first_name, last_name, total_worth, company) %>%
  group_by() %>%
  mutate(rank = percent_rank(total_worth)) %>%
  ungroup() %>%
  filter(rank > 0.75)

emp %>%
  filter(!is.na(total_worth)) %>%
  select(first_name, last_name, gender, total_worth) %>%
  arrange(last_name) %>%
  group_by() %>%
  mutate(running_total = cumsum(total_worth)) %>%
  ungroup()


# Lag: get access to data records in the same column but a different row
sales <- data_frame(year = c(2008:2017),
                    revenue = rnorm(n = 10, mean = 140000, sd = 12000))

sales %>%
  mutate(revenue_py = lag(revenue)) %>%
  filter(!is.na(revenue_py)) %>%
  mutate(pct_yy = (revenue - revenue_py) / revenue) %>%
  arrange(desc(pct_yy))

