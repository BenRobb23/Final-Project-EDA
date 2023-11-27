library(tidyverse)   # for working with the data
library(lubridate)   # for working with datetime data

library(skimr)       # generate a text-based overview of the data
library(visdat)      # generate plots visualizing data types and missingness
library(plotly)      # quickly create interactive plots


data_dir <- 'data'
target_file <- file.path(data_dir, 'sauces.zip')

if (dir.exists(data_dir)) {
  dir.create(data_dir)
}

if (!file.exists(target_file)) {
  download.file('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-08-08/sauces.csv',
                target_file)
}


dataf <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-08-08/sauces.csv')

skim(dataf)

head(sauces)

summary(sauces)

str(sauces)

summary(sauces$sauce_number, sauce_name, scoville)

summary(select(sauces, sauce_number, sauce_name, scoville))

ggplot(sauces, aes(x = sauce_number)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Histogram of Sauce Number")

ggplot(sauces, aes(x = sauce_name)) +
  geom_bar(fill = "green") +
  labs(title = "Bar Plot of Sauce Name")

scoville_column <- "scoville"

if (scoville_column %in% names(sauces)) {
  print("Column 'scoville' found in the dataset.")
} else {
  print("Column 'scoville' not found in the dataset.")
}

ggplot(sauces, aes(x = scoville)) +
  geom_bar(fill = "orange") +
  labs(title = "Scoville Ratings Distribution", x = "Scoville Rating") +
  theme_minimal()

ggplot(sauces, aes(x = sauce_name, y = scoville)) +
  geom_point(color = "red") +
  labs(title = "Scatterplot of Sauce Name vs. Scoville")

sauces <- sauces %>%
  mutate(sauce_name_numeric = as.numeric(factor(sauce_name)))

head(sauces)

sauces$sauce_name_numeric <- as.numeric(factor(sauces$sauce_name))

correlation_matrix <- cor(sauces[, c("sauce_name_numeric", "sauce_number")])
print(correlation_matrix)

cross_tab <- table(sauces$season, sauces$sauce_name)
print(cross_tab)
mosaicplot(cross_tab, color = TRUE)

ggplot(sauces, aes(x = season, fill = sauce_name)) +
  geom_bar(position = "dodge") +
  labs(title = "Bar Plot of Season vs. Sauce Name") +
  theme(legend.position = "right")

sauces$season <- as.numeric(sauces$season)

pairs(sauces[c("season", "sauce_number", "sauce_name_numeric")])

ggplot(sauces, aes(x = sauce_name, y = scoville)) +
  geom_boxplot(fill = "purple") +
  labs(title = "Box Plot of Scoville by Sauce Name")

install.packages("corrplot")
library(corrplot)

correlation_matrix <- cor(select(sauces, sauce_name_numeric, scoville))
corrplot(correlation_matrix, method = "color")

sauces <- tryCatch(
  read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-08-08/sauces.csv'),
  error = function(e) {
    cat("Error:", conditionMessage(e), "\n")
    sauces <- NULL
  }
)

if (!is.null(sauces)) {
  head(sauces)
} else {
  cat("Failed to load the 'sauces' dataset.\n")
}


column_names <- names(sauces)
print(column_names)

sauces$numeric_sauce_name <- as.numeric(factor(sauces$sauce_name))

unique_values <- unique(sauces$numeric_sauce_name)
print(unique_values)