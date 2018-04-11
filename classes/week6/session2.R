library(dplyr)
library(ggplot2)
library(caret)

data("diamonds")
set.seed(99)


# Building a Regression Model
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = x, y = price))

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = y, y = price))

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = z, y = price))

# Regression: How well could we predict the price based on other properties? -----------------------

features <- diamonds %>%
  select(carat)

labels <- diamonds$price

model <- train(x = features, y = labels, method = 'lm')

model$results
model$finalModel$coefficients

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price)) +
  geom_abline(intercept = model$finalModel$coefficients[[1]],
              slope = model$finalModel$coefficients[[2]],
              color = 'dark red', size = 2)

# Classification: how well can we predict a category based on data? --------------------------------
features <- diamonds %>%
  select(carat, price)

labels <- diamonds %>%
  mutate(is_ideal = as.factor(cut == 'Ideal')) %>%
  .$is_ideal

model <- train(x = features, y = labels, method = 'glm')

model$results


# Splitting Data into training and testing ---------------------------------------------------------

as.vector(createDataPartition(y = 1:50, times = 1, p = 0.5, list = FALSE))


idx_train <- as.vector(createDataPartition(y = 1:nrow(diamonds), times = 1, p = 0.75, list = FALSE))

train_data <- diamonds %>%
  mutate(idx_row = 1:n()) %>%
  filter(idx_row %in% idx_train)

test_data <- diamonds %>%
  mutate(idx_row = 1:n()) %>%
  filter(!(idx_row %in% idx_train))


features_train <- train_data %>%
  select(carat)

features_test <- test_data %>%
  select(carat)

labels_train <- train_data$price
labels_test <- test_data$price

# Build a model with the Training Data
model <- train(x = features_train, y = labels_train, method = 'lm')
model$results

ggplot(data = train_data) +
  geom_point(mapping = aes(x = carat, y = price)) +
  geom_abline(intercept = model$finalModel$coefficients[[1]],
              slope = model$finalModel$coefficients[[2]],
              color = 'dark red', size = 2)

# Make Predictions against the Test Data
pred <- as.vector(predict(model, features_test))
test_data <- test_data %>%
  mutate(model_pred = pred) %>%
  mutate(error = (pred - price),
         sq_error = (pred - price) ^ 2)

ggplot(data = test_data) +
  geom_point(mapping = aes(x = carat, y = price)) +
  geom_abline(intercept = model$finalModel$coefficients[[1]],
              slope = model$finalModel$coefficients[[2]],
              color = 'dark red', size = 2)

ggplot(data = test_data) +
  geom_histogram(mapping = aes(x = error), bins = 50)

ggplot(data = test_data) +
  geom_density(mapping = aes(x = sq_error))

mean(test_data$sq_error)




# Visual Intro to Machine Learning Classification
# http://www.r2d3.us/visual-intro-to-machine-learning-part-1/
