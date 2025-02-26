# Annotated follow-along guide: Compute descriptive statistics with R

## Introduction
# In this script, we explore the education dataset by computing descriptive statistics.
# We'll load the dataset, inspect its first few rows, compute key statistics for the literacy rate,
# and analyze the categorical variable for state names.

## Import required libraries
# Although base R functions are sufficient for this analysis, we load dplyr for data manipulation and ggplot2 for potential plotting.
library(dplyr)
library(ggplot2)

## Load the dataset
# Replace the file path with the correct path to 'education_districtwise.csv'
education_districtwise <- read.csv("education_districtwise.csv")

## Explore the data
# View the first 10 rows to get a quick overview of the dataset.
head(education_districtwise, 10)

## Compute descriptive statistics for the literacy rate (OVERALL_LI)
# Using the summary() function to get key stats: min, 1st quartile, median, mean, 3rd quartile, and max.
summary(education_districtwise$OVERALL_LI)

# Alternatively, compute individual statistics for further analysis.
# Count of non-missing observations
count <- sum(!is.na(education_districtwise$OVERALL_LI))

# Mean literacy rate
mean_val <- mean(education_districtwise$OVERALL_LI, na.rm = TRUE)

# Standard deviation
sd_val <- sd(education_districtwise$OVERALL_LI, na.rm = TRUE)

# Minimum and Maximum values
min_val <- min(education_districtwise$OVERALL_LI, na.rm = TRUE)
max_val <- max(education_districtwise$OVERALL_LI, na.rm = TRUE)

# First and Third Quartiles (25th and 75th percentiles)
q1 <- quantile(education_districtwise$OVERALL_LI, 0.25, na.rm = TRUE)
median_val <- median(education_districtwise$OVERALL_LI, na.rm = TRUE)
q3 <- quantile(education_districtwise$OVERALL_LI, 0.75, na.rm = TRUE)

# Display the computed statistics
cat("Descriptive Statistics for OVERALL_LI:\n")
cat("Count:", count, "\n")
cat("Mean:", mean_val, "\n")
cat("Standard Deviation:", sd_val, "\n")
cat("Minimum:", min_val, "\n")
cat("25th Percentile:", q1, "\n")
cat("Median:", median_val, "\n")
cat("75th Percentile:", q3, "\n")
cat("Maximum:", max_val, "\n")

## Compute the range of the literacy rate
# The range is the difference between the maximum and minimum values.
range_overall_li <- max_val - min_val
cat("Range of Literacy Rates:", range_overall_li, "\n")

## Descriptive statistics for a categorical variable (STATNAME)
# Convert STATNAME to a factor (if it isn't already) and use summary() to reveal counts and unique values.
education_districtwise$STATNAME <- as.factor(education_districtwise$STATNAME)
cat("\nDescriptive Statistics for STATNAME:\n")
summary(education_districtwise$STATNAME)

## Conclusion
# You have now computed key descriptive statistics in R.
# These insights can help in understanding the spread and central tendency of literacy rates across districts,
# as well as provide a summary of the categorical state data.

