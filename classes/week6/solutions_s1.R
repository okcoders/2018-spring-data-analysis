library(ggplot2)
library(dplyr)


# Load the diamonds dataset
data(diamonds)


# Make a histogram of the price of all diamonds in the set. Set the binwidth such that each bin 
# will represent $1000 of price value.

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 1000)


# Make a scatter plot of the depth vs carat size of each diamond. Make sure to set the alpha of the 
# points small enough that we can see where the density shows up in the set.

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = depth, y = carat), alpha = 0.05)


# Improve this same scatter plot to show different colors for each clarity level.

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = depth, y = carat, color = clarity), alpha = 0.1)


# Let's go one step further and make a 2 dimensional density plot of this same data (not including
# the clarity).

ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = depth, y = carat))


# Make a density plot of the price of all "Fair" cut diamonds.

diamonds %>%
  filter(cut == "Fair") %>%
  ggplot(data = .) +
  geom_density(mapping = aes(x = price))


# Make column chart by clarity of the median carat size of each group of diamonds. Make the bars
# red with a black outline, and give both the X and Y axes friendly names, with a clean title.

diamonds %>%
  group_by(clarity) %>%
  summarise(med_carat = median(carat)) %>%
  ungroup() %>%
  ggplot(data = .) +
  geom_col(mapping = aes(x = clarity, y = med_carat),
           fill = 'dark red',
           color = 'black',
           size = 1.5) +
  labs(x = "Diamond Clarity Rating",
       y = "Median Carat Size",
       title = "Median Diamond Size by Clarity Rating") +
  theme_dark()


# Make a violin plot of price by cut for all that have a greater than average price and carat size
# for their clarity level. Name the plot 'Distribution of Large and Expensive Diamonds', and give
# a friendly label to the y axis. Choose and implement a custom theme, and please make each violin
# a different color.

diamonds %>%
  select(clarity, cut, price, carat) %>%
  group_by(clarity) %>%
  mutate(mean_price = mean(price),
         mean_carat = mean(carat)) %>%
  ungroup() %>%
  filter((price > mean_price) & (carat > mean_carat)) %>%
  ggplot(data = .) +
  geom_violin(mapping = aes(x = cut, y = price, fill = cut)) +
  labs(title = "Distribution of Large and Expensive Diamonds",
       x = "", y = "Price in Dollars") +
  theme_minimal()


