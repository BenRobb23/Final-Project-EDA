README
Overview
This R script performs an analysis of 'Hot Ones' data, specifically focusing on the causal effect of the spiciness level of hot sauces featured on the show on the guest's ability to complete the 'Hot Ones' challenge. The analysis controls for season and episode characteristics. It merges information from two CSV files, 'episodes.csv' and 'sauces.csv', and conducts various exploratory data analyses and visualizations.

Instructions
Prerequisites
Ensure you have R installed on your machine.

Package Installation
Before running the script, install the required R packages. Uncomment and run the following code to install the necessary packages:

R
Copy code
# install.packages(c("dplyr", "tidyverse", "lubridate", "skimr", "corrplot", "visdat", "plotly"))
Execution
Load the required libraries:
  R
  Copy code
  library(dplyr)
  library(tidyverse)
  library(lubridate)
  library(skimr)
  library(corrplot)
  library(visdat)
  library(plotly)
Load and process the data:
  R
  Copy code
# Load data from CSV files
  df1 <- read.csv("episodes.csv")
  df2 <- read.csv("sauces.csv")

# Define column names
  column_names_df1 <- c("Season", "Episode_Overall", "Episode_Season", "Title", "Original_Release", "Guest", "Guest_Appearance_Number", "Finished")
  column_names_df2 <- c("Season", "Sauce_Number", "Sauce_Name", "Scoville")

# Assign column names to dataframes
  colnames(df1) <- column_names_df1
  colnames(df2) <- column_names_df2

# Explore and analyze sauces dataset
  data_dir <- 'data'
  target_file <- file.path(data_dir, 'sauces.zip')

# Explore and analyze episodes dataset
  dataf <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-08-08/episodes.csv")


# Merge data from both datasets
  merged_data <- merge(df1, df2, by.x = "Season", by.y = "Season")

Data Exploration and Visualization:

Explore the merged dataset and create visualizations:

  Box plot; Scatterplot matrix; Correlation heatmap; Boxplot of spiciness by season; Violin plot of ability to complete challenge vs. spiciness; Time series plot of spiciness and ability to complete challenge
