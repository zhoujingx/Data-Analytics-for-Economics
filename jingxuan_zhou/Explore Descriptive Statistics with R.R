# ------------------------------------------------------------------------------
# Activity: Explore descriptive statistics in R
# ------------------------------------------------------------------------------

# Introduction:
# Data professionals use descriptive statistics to summarize and understand data.
# In this lab, you are part of an analytics team at the U.S. EPA.
# You will analyze air quality data with respect to carbon monoxide levels.
# The dataset "c4_epa_air_quality.csv" contains data from over 200 monitoring sites,
# including information such as state, county, city, and local site names, as well as AQI values.
# The goal is to compute descriptive statistics and share insights with stakeholders.

# ------------------------------------------------------------------------------
# Step 1: Imports and Data Loading
# ------------------------------------------------------------------------------

# Import relevant libraries. In R, we can use base functions for most tasks,
# but we'll load the "dplyr" package for data manipulation (if not installed, run install.packages("dplyr"))
library(dplyr)

# Load the dataset.
# Note: If needed, adjust the file path to where "c4_epa_air_quality.csv" is located.
epa_data <- read.csv("c4_epa_air_quality.csv", stringsAsFactors = TRUE)
# If you want to set the first column as row names (similar to index_col=0 in pandas), you can use:
# epa_data <- read.csv("c4_epa_air_quality.csv", row.names = 1, stringsAsFactors = FALSE)

# ------------------------------------------------------------------------------
# Step 2: Data Exploration
# ------------------------------------------------------------------------------

# 2a. Display the first 10 rows of the data.
head(epa_data, 10)

# -------------------------------------------------------------------------------
# Questions:
# 1. What does the "aqi" column represent?
#    YOUR ANSWER: 
#       (e.g., The "aqi" column represents the Air Quality Index, which is a numerical scale used to gauge 
#        how polluted the air is at a particular location.)
#
# 2. In what units are the aqi values expressed?
#    YOUR ANSWER:
#       (e.g., AQI values are unitless numbers that correspond to levels of air pollution; for carbon monoxide, 
#        an AQI of 100 corresponds to about 9 parts per million.)
# -------------------------------------------------------------------------------

# 2b. Get a table of descriptive statistics for the numeric columns.
# In R, we use the summary() function to see key statistics.
summary(epa_data)

# -------------------------------------------------------------------------------
# Questions:
# 3. Based on the descriptive statistics table, what do you notice about the count for the "aqi" column?
#    YOUR ANSWER:
#       (e.g., Check if there are any missing values and note the number of non-NA observations.)
#
# 4. What do you notice about the 25th percentile for the "aqi" column?
#    YOUR ANSWER:
#       (e.g., This value gives insight into the lower quartile of air quality measurements.)
#
# 5. What do you notice about the 75th percentile for the "aqi" column?
#    YOUR ANSWER:
#       (e.g., This value indicates the upper quartile and helps to understand where most values lie.)
# -------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Step 3: Statistical Tests and Further Exploration
# ------------------------------------------------------------------------------

# 3a. Get descriptive statistics about the states in the data.
# Assuming there is a column for state names (e.g., "state" or "State"). 
# If your column is named differently (like "STATENAME"), adjust accordingly.
# First, convert the state column to a factor.
epa_data$state <- as.factor(epa_data$state)  # Change "state" to the appropriate column name if needed.
summary(epa_data$state)

# -------------------------------------------------------------------------------
# Question:
# 6. What do you notice while reviewing the descriptive statistics for the state data?
#    YOUR ANSWER:
#       (e.g., You might note the number of unique states, the most common state, and the frequency of each.)
# -------------------------------------------------------------------------------

# 3b. Alternatively, calculate individual statistics for the "aqi" column using base R functions.
# Calculate the mean, median, min, max, and standard deviation.

# Count (number of non-missing values)
aqi_count <- sum(!is.na(epa_data$aqi))

# Mean
aqi_mean <- mean(epa_data$aqi, na.rm = TRUE)

# Median
aqi_median <- median(epa_data$aqi, na.rm = TRUE)

# Minimum value
aqi_min <- min(epa_data$aqi, na.rm = TRUE)

# Maximum value
aqi_max <- max(epa_data$aqi, na.rm = TRUE)

# Standard Deviation (Note: R's sd() uses sample standard deviation, equivalent to ddof = 1)
aqi_sd <- sd(epa_data$aqi, na.rm = TRUE)

# Calculate the range (max - min)
aqi_range <- aqi_max - aqi_min

# Print out the computed statistics.
cat("Descriptive Statistics for 'aqi':\n")
cat("Count:", aqi_count, "\n")
cat("Mean:", aqi_mean, "\n")
cat("Median:", aqi_median, "\n")
cat("Minimum:", aqi_min, "\n")
cat("Maximum:", aqi_max, "\n")
cat("Range:", aqi_range, "\n")
cat("Standard Deviation:", aqi_sd, "\n")

# -------------------------------------------------------------------------------
# Questions:
# 7. What do you notice about the mean value of the "aqi" column?
#    YOUR ANSWER: The mean AQI is: 6.76
#       (e.g., The mean represents the average air quality index across all sites, giving an overall idea 
#        of air pollution levels.)
#
# 8. What do you notice about the median value of the "aqi" column?
#    YOUR ANSWER: The median AQI is: 5.00
#       (e.g., The median gives a robust measure of central tendency that isn’t as affected by outliers.)
#
# 9. What do you notice about the minimum value of the "aqi" column?
#    YOUR ANSWER: The min AQI is: 0.00
#       (e.g., The minimum value shows the best air quality observed in the data.)
#
# 10. What do you notice about the maximum value of the "aqi" column?
#     YOUR ANSWER: The max AQI is: 50.00
#       (e.g., The maximum value shows the worst air quality observed in the data.)
#
# 11. What do you notice about the standard deviation of the "aqi" column?
#     YOUR ANSWER: The standard deviation of AQI is: 7.06
#       (e.g., A larger standard deviation indicates that the aqi values are more spread out, suggesting higher variability.)
# -------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Step 4: Results and Evaluation
# ------------------------------------------------------------------------------

# Reflect on the analysis by answering these questions:
#
# 12. What are some key takeaways you learned during this lab?
#     YOUR ANSWER: From reviewing the descriptive statistics, it's noticeable that the dataset includes observations 
#                  from 52 unique states or jurisdictions, indicating comprehensive geographic coverage, including 
#                  potentially territories or special districts. Additionally, California appears most frequently 
#                  (66 observations out of 260), suggesting the dataset may have a geographical focus or bias towards 
#                  this state, possibly due to higher population density or more air-quality monitoring stations.
#       (e.g., Descriptive statistics provide a quick summary of the distribution of data. The central 
#        tendency measures (mean and median) and measures of spread (range and standard deviation) are essential 
#        for understanding overall trends and variability in the air quality data.)
#
# 13. How would you present your findings from this lab to others?
#     YOUR ANSWER: using graph, and statistic table. 
#       (e.g., I would explain that most AQI values fall within a specific range, with a certain percentage 
#        of sites showing satisfactory air quality. I would also highlight any sites with extreme values and explain 
#        their implications for public health.)
#
# 14. What summary would you provide to stakeholders (considering that "AQI values at or below 100 are generally
#     thought of as satisfactory" and an AQI of 100 for carbon monoxide corresponds to about 9 parts per million)?
#     YOUR ANSWER: 1. The dataset analyzed includes 260 observations, covering 52 unique states or jurisdictions across the United States, indicating broad geographic representation.
#                  2. California appears most frequently (66 observations), which suggests more intensive air quality monitoring activities or a larger number of reporting stations in California relative to other states.
#                  3. The overall mean AQI across all observations is low, suggesting generally satisfactory air quality in most recorded instances, well below the threshold of 100.
#                  4. The standard deviation indicates the variation in air quality. The standard deviation of the api is 7.06, which is relatively lower indicating a consistent air quality.
#       (e.g., I would summarize that while the average AQI across monitoring sites is [insert mean here], many sites 
#        exhibit AQI values above 100, indicating potential air quality issues. Further, specific sites may require more 
#        detailed investigation to protect sensitive populations.)
#
# References:
# - Air Quality Index - A Guide to Air Quality and Your Health.
#   https://www.airnow.gov/sites/default/files/2018-04/aqi_brochure_02_14_0.pdf (2014, February)
#
# - NumPy Std Documentation (for context on standard deviation differences):
#   https://numpy.org/doc/stable/reference/generated/numpy.std.html
#
# - US EPA, OAR. (2014, July 8). Air Data: Air Quality Data Collected at Outdoor Monitors Across the US.
#   https://www.epa.gov/outdoor-air-quality-data

# ------------------------------------------------------------------------------
# End of Lab
# ------------------------------------------------------------------------------
