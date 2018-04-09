library(ggplot2)
library(dplyr)



# Load the diamonds dataset from examples
data(diamonds)


# Pipeline: ggplot operates similar to a pipeline, where you map your data into the ggplot
# environment, and then add layers one at a time onto the final graphic.

ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price))

ggplot(data = diamonds) + 
  geom_density(mapping = aes(x = price))


# On top of the visual mapping you can add more layers to refine your graphic, and more params
# to customize how your want your graphics to look.
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price), 
                 binwidth = 250,
                 color = 'black',
                 fill = 'steelblue') +
  labs(x = "Diamond Prices",
       y = "Number of Diamonds in Price Range",
       title = "Distribution of Diamond Prices",
       subtitle = "[$250 unit bands]") +
  theme_minimal()


# Two Variable Encodings
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = cut, y = carat))

# Params can be designated directly or mapped to data
ggplot(data = diamonds) +
  geom_jitter(mapping = aes(x = carat, y = price), 
              alpha = 0.1, size = 1, color = 'steelblue')

ggplot(data = diamonds) +
  geom_jitter(mapping = aes(x = carat, y = price, color = cut), 
              alpha = 0.1, size = 1)

ggplot(data = diamonds) +
  geom_violin(mapping = aes(x = cut, y = price))


# Some are looking for discrete values and will need to be aggregated first to make sense.
ggplot(data = diamonds) +
  geom_col(mapping = aes(x = cut, y = price))

# We can use dplyr grouping to do that
diamonds %>%
  group_by(cut) %>%
  summarise(mean_price = mean(price)) %>%
  ggplot(data = .) +
  geom_col(mapping = aes(x = cut, y = mean_price))


