# For the first project,we are going to be exploring some traffic violation data from all Traffic
# Violations issued in Montgomery County Maryland. You can read more about the data here:
# https://catalog.data.gov/dataset/traffic-violations-56dda

# The full dataset is pretty big with ~1.26 million rows. Once uncompressed it is about 460MB in
# size, which for some machines may be a pretty heavy workload of data. If you would like to tackle
# using the entire dataset, please use this link to get the compressed version of the CSV.
# https://www.dropbox.com/s/76b873tivk90hid/Traffic_Violations.csv.zip?dl=0

library(lubridate)
library(dplyr)



traffic <- tbl_df(read.csv("Traffic_Violations.csv"))


# Perform an analysis of all incidents where either a seatbelt was not worn or alcohol was a factor.
# Quantify which was more likely to result in a fatal incident.

traffic %>%
  filter(Fatal == 'Yes') %>%
  select(Date.Of.Stop, Time.Of.Stop, Belts, Alcohol) %>%
  mutate(Belts = (Belts == 'Yes'),
         Alcohol = (Alcohol == 'Yes')) %>%
  group_by() %>%
  summarise(n_incidents = n(),
            n_belts = sum(Belts),
            n_alcohol = sum(Alcohol)) %>%
  ungroup() %>%
  mutate(pct_belts = (n_belts / n_incidents),
         pct_alcohol = (n_alcohol / n_incidents))


# Of all non-fatal car crashes, determine if the year-to-year trend has any discernable pattern. Does
# it appear the rate is going up, down, erratic, or mostly unchanged? Is that trend any different
# for accidents that caused Personal Injury in general, and/or Property Damage?

yy_trend <- traffic %>%
  filter(Fatal == 'No') %>%
  select(Date.Of.Stop, Personal.Injury, Property.Damage) %>%
  mutate(Date.Of.Stop = mdy(Date.Of.Stop)) %>%
  mutate(year_stop = year(Date.Of.Stop)) %>%
  group_by(year_stop) %>%
  summarise(total_cy = n(),
            inj_cy = sum(Personal.Injury == 'Yes'),
            prop_cy = sum(Property.Damage == 'Yes')) %>%
  ungroup() %>%
  arrange(year_stop) %>%
  mutate(total_py = lag(total_cy),
         inj_py = lag(inj_cy),
         prop_py = lag(prop_cy)) %>%
  filter(!is.na(total_py), year_stop < 2018) %>%
  mutate(total_yy = ((total_cy - total_py) / total_py),
         inj_yy = ((inj_cy - inj_py) / inj_py),
         prop_yy = ((prop_cy - prop_py) / prop_py))

plot(x = yy_trend$year_stop, y = yy_trend$total_yy)
plot(x = yy_trend$year_stop, y = yy_trend$inj_yy)
plot(x = yy_trend$year_stop, y = yy_trend$prop_yy)


# What hour of the day do the most non-fatal injuries not involving alchohol occur? What day of the
# week? Do those values change if we take into account whether the person driving has a commercial
# license or not? What if we factor out incidents that occur in work zones?

traffic %>%
  filter(Fatal == 'No', Alcohol == 'No') %>%
  select(Date.Of.Stop, Time.Of.Stop, Commercial.License, Work.Zone) %>%
  mutate(DT_Stop = mdy_hms(paste(Date.Of.Stop, ' ', Time.Of.Stop))) %>%
  group_by(hour(DT_Stop)) %>%
  #group_by(wday(DT_Stop)) %>%
  summarise(total = n(),
            comm_lic = sum(Commercial.License == 'Yes'),
            non_workzone = sum(Work.Zone == 'No')) %>%
  ungroup() %>%
  group_by() %>%
  mutate(oa_total = sum(total),
         oa_comm = sum(comm_lic),
         oa_nwz = sum(non_workzone)) %>%
  ungroup() %>%
  mutate(pct_total = (total / oa_total),
         pct_comm = (comm_lic / oa_comm),
         pct_nwz = (non_workzone / oa_nwz)) %>%
  select(-c(total, comm_lic, non_workzone, oa_total, oa_comm, oa_nwz)) %>%
  arrange(pct_total) %>%
  mutate(eq_share = (1.00 / 24)) %>%
  mutate(dev_total = (pct_total - eq_share))


# Expanding on the prior question, quantify the frequency relationship for any given hour of the day
# compared to the overall daily rate of non-Personal Injury incidents.

traffic %>%
  filter(Personal.Injury == 'No') %>%
  select(Date.Of.Stop, Time.Of.Stop) %>%
  mutate(DT_Stop = mdy_hms(paste(Date.Of.Stop, ' ', Time.Of.Stop))) %>%
  group_by(weekdays(DT_Stop)) %>%
  summarise(total = n()) %>%
  ungroup() %>%
  group_by() %>%
  mutate(oa_total = sum(total)) %>%
  ungroup() %>%
  mutate(pct_total = (total / oa_total),
         n_groups = n()) %>%
  select(-c(oa_total)) %>%
  mutate(eq_share = (1.00 / n_groups)) %>%
  mutate(dev_total = (pct_total - eq_share)) %>%
  select(-c(total, eq_share, n_groups)) %>%
  arrange(desc(dev_total))


# Are Commerical Vehicles more or less likely to be involved in incidents where HAZMAT is needed?
# What about incidents that occur in Work Zones?

# Without Scaling
traffic %>%
  #filter(HAZMAT == 'Yes') %>%
  filter(Work.Zone == 'Yes') %>%
  group_by(Commercial.Vehicle) %>%
  summarise(incidents = n()) %>%
  arrange(desc(incidents))


# With Scaling
traffic %>%
  group_by(Commercial.Vehicle, HAZMAT) %>%
  summarise(incidents = n()) %>%
  ungroup() %>%
  group_by(Commercial.Vehicle) %>%
  mutate(all_comm = sum(incidents)) %>%
  ungroup() %>%
  filter(HAZMAT == 'Yes') %>%
  mutate(pct_all = (incidents / all_comm)) %>%
  arrange(desc(pct_all))


traffic %>%
  group_by(Commercial.Vehicle, Work.Zone) %>%
  summarise(incidents = n()) %>%
  ungroup() %>%
  group_by(Commercial.Vehicle) %>%
  mutate(all_comm = sum(incidents)) %>%
  ungroup() %>%
  filter(Work.Zone == 'Yes') %>%
  mutate(pct_all = (incidents / all_comm)) %>%
  arrange(desc(pct_all))


# What 5 states (not including Maryland) bring in the highest number of Citations as a share of that
# state's relative population? (Hint: you might need to go find more data to answer this).

# Source: https://github.com/BuzzFeedNews/2015-11-refugees-in-the-united-states/blob/master/data/census-state-populations.csv
state_pop <- tbl_df(read.csv("state_population_2014.csv"))

traffic %>%
  filter(Violation.Type == 'Citation', Driver.State != 'MD') %>%
  select(Date.Of.Stop, Time.Of.Stop, Driver.State) %>%
  group_by(Driver.State) %>%
  summarise(citations = n()) %>%
  ungroup() %>%
  inner_join(y = state_pop, by = c("Driver.State" = "code")) %>%
  mutate(pct_pop = (citations / pop_est_2014)) %>%
  arrange(desc(pct_pop))
