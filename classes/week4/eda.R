library(dplyr)

install.packages("lubridate")
library(lubridate)


data <- tbl_df(read.csv("Traffic_Violations.csv"))
data
dim(data)

summary(data$Belts)
sum(data$Belts == 'Yes') / length(data$Belts)

summary(data$Alcohol)
summary(data$Fatal)
sum((data$Fatal == 'Yes') & (data$Alcohol == 'Yes'))


# Small set ----------------------------------------------------------------------------------------
data %>%
  filter(SubAgency == "2nd district, Bethesda") %>%
  write.csv(x = ., file = "Traffic_Violations_Bethesda.csv")
