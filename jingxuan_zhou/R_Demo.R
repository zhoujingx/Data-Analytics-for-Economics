# Define a function named my_function that prints "Hello Husky!"
my_function <- function() {
  print("Hello Husky!")
}


# --------------------------
# Demonstrating Data Types:
# --------------------------

# Numeric: a standard decimal number
x <- 10.5
class(x)  # Returns "numeric"

# Integer: the "L" suffix specifies an integer
x <- 1000L
class(x)  # Returns "integer"

# Complex: a number with an imaginary component
x <- 9i + 3
class(x)  # Returns "complex"

# Character/String: text data
x <- "R is exciting"
class(x)  # Returns "character"

# Logical/Boolean: TRUE or FALSE
x <- TRUE
class(x)  # Returns "logical"


# --------------------------
# Installing and Loading Packages:
# --------------------------

# Install the entire tidyverse (includes magrittr for the pipe operator)
# install.packages("tidyverse")

# Alternatively, install just the magrittr package if needed:
# install.packages("magrittr")

# Load the magrittr package to use the pipe operator (%>%)
library(magrittr)


# --------------------------
# Vector Operations:
# --------------------------

# Create a vector of numbers from 1 to 5
vec <- c(1, 2, 3, 4, 5)

# Calculate the sum of square roots using nested functions
sum_sqrt <- sum(sqrt(vec))

# Calculate the sum of square roots using the pipe operator for clarity
sum_sqrt_pipe <- vec %>% sqrt() %>% sum()

# Print both results to verify they are identical
print(sum_sqrt)
print(sum_sqrt_pipe)


# --------------------------
# Creating Arrays:
# --------------------------

# Create two vectors of different lengths
vector1 <- c(5, 9, 3)
vector2 <- c(10, 11, 12, 13, 14, 15)

# Combine vectors into an array with dimensions 3x3x2
# (Values will be recycled as needed)
result_array <- array(c(vector1, vector2), dim = c(3, 3, 2))
print(result_array)


# --------------------------
# Creating and Naming Matrices:
# --------------------------

# Create a matrix with 2 rows and 3 columns, filling by row
A <- matrix(c(11, 22, 33, 44, 55, 66), 
            nrow = 2, ncol = 3, byrow = TRUE)
print(A)

# Define names for the columns, rows, and the matrix layer
column.names <- c("COL1", "COL2", "COL3")
row.names <- c("ROW1", "ROW2")
matrix.names <- c("Matrix")

# Create an array with named dimensions using the matrix A
A_name <- array(A, dim = c(2, 3, 1), dimnames = list(row.names, column.names, matrix.names))
print(A_name)


# --------------------------
# Data Frames and Their Manipulation:
# --------------------------

# Create a data frame with company information
comp.data <- data.frame(
  comp_id = c(1:3),                           # Company IDs
  comp_name = c("Husky", "NEU", "Econ"),        # Company names
  growth = c(16000, 14000, 12000),              # Growth metric
  comp_start_date = as.Date(c("02/05/10", "04/04/10", "05/03/10"))  # Start dates
)
print(comp.data)

# Display the structure of the data frame
print(str(comp.data))

# Display summary statistics for the data frame
print(summary(comp.data)) 

# Extract the 'comp_name' column into a new data frame
result_comp_name <- data.frame(comp.data$comp_name)
print(result_comp_name)

# Access data frame columns using different methods:
comp.data[1]             # Access first column by index
comp.data[['comp_name']] # Access 'comp_name' column by name
comp.data$comp_id        # Access 'comp_id' column using the $ operator

# Add a new row for a new company using rbind (row binding)
New_Company <- c(4, "FiveTwo", 19000, '6-03-10')
comp.data <- rbind(comp.data, New_Company)

# Add a new column 'region' to the data frame using cbind (column binding)
region <- c("E", "W", "N", "S")  # New column values (ensure length matches number of rows)
comp.data <- cbind(comp.data, region)

# Remove the row where comp_id equals 4 using subset
comp.data <- subset(comp.data, comp_id != 4)

# Remove the 'region' column using dplyr's select function
comp.data <- dplyr::select(comp.data, -region)


# --------------------------
# Combining Data Frames:
# --------------------------

# Create two sample data frames to combine by rows (rbind)
df1 <- data.frame(
  Name = c("Alice", "Bob"),
  Age = c(25, 30),
  Score = c(80, 75)
)
df2 <- data.frame(
  Name = c("Charlie", "David"),
  Age = c(28, 35),
  Score = c(90, 85)
)

cat("Dataframe 1:\n")
print(df1)
cat("\nDataframe 2:\n")
print(df2)

# Combine df1 and df2 row-wise
combined_df <- rbind(df1, df2)
cat("\nCombined Dataframe (using rbind):\n")
print(combined_df)

# Create two sample data frames to combine by columns (cbind)
df1 <- data.frame(
  Name = c("Alice", "Bob"),
  Age = c(25, 30),
  Score = c(80, 75)
)
df2 <- data.frame(
  Height = c(160, 175),
  Weight = c(55, 70)
)

cat("Dataframe 1:\n")
print(df1)
cat("\nDataframe 2:\n")
print(df2)

# Combine df1 and df2 column-wise
combined_df <- cbind(df1, df2)
cat("\nCombined Dataframe (using cbind):\n")
print(combined_df)


# --------------------------
# Type Checking and Coercion:
# --------------------------

# Define some variables of different types
num <- 2.2
class(num)  # Numeric

int <- 5
class(int)  # Numeric (by default in R)

char <- "hello"
class(char)  # Character

logi <- TRUE
class(logi)  # Logical

# Check if variables are of specific types
is.numeric(num)     # TRUE
is.character(num)   # FALSE

is.character(char)  # TRUE
is.logical(logi)    # TRUE

# Coerce numeric to character
num_char <- as.character(num)
print(num_char)
class(num_char)  # "character"

# Attempt to coerce a character to numeric (will produce NA if coercion fails)
char_num <- as.numeric(char)
print(char_num)  # Likely returns NA with a warning


# --------------------------
# Working with Lists:
# --------------------------

# Create a list of strings
thislist <- list("Husky", "0315", "Econ")
print(thislist)

# Change the first element of the list
thislist[1] <- "NEU"
print(thislist)

# Get the length of the list
length(thislist)

# Check if "NEU" exists in the list
"NEU" %in% thislist

# Append "Husky" to the end of the list
thislist <- append(thislist, "Husky")
print(thislist)

# Append "Husky2" after the second element
thislist <- append(thislist, "Husky2", after = 2)
print(thislist)

# Access a range of elements (indexes 2 to 5)
print(thislist[2:5])

# Loop through each element in the list and print it
for (x in thislist) {
  print(x)
}

# Remove the first element from the list (resulting in a new list)
newlist <- thislist[-1]
print(newlist)

# Combine two lists together
list1 <- list("a", "b", "c")
list2 <- list(1, 2, 3)
list3 <- c(list1, list2)
print(list3)


# --------------------------
# Dates and Times:
# --------------------------

# Get current date and time as a string
print(date())

# Get the current system date as a Date object
print(Sys.Date())

# Load the lubridate package for easier date/time handling
library(lubridate)
print(today())  # Today's date
print(now())    # Current date and time

# Parse dates from strings in different formats:
print(ymd("2025-02-18"))                    # Year-Month-Day format
print(mdy("February 18th, 2025"))             # Month-Day-Year with text
print(dmy("18-Feb-2025"))                     # Day-Month-Year format
print(ymd_hms("2025-02-18 20:11:59", tz = "EST"))  # Date-time with timezone

# Convert a numeric date in ymd format (e.g., 20250218) into a date
print(ymd(20250218))


# --------------------------
# Working with the nycflights13 Dataset:
# --------------------------

# Install and load the nycflights13 package for flight data
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# Select specific columns (year, month, day, hour, minute) and display the first few rows
flights %>% 
  select(year, month, day, hour, minute) %>% 
  head()

# Create a new column 'departure' by combining date and time columns
flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))

# Define a custom function to create datetime objects from a time given in HHMM format
make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

# Process the flights dataset:
# - Filter out rows with missing departure or arrival times
# - Create new datetime columns for dep_time, arr_time, scheduled departure/arrival times
flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time"))

print(flights_dt)

# Install ggplot2 if not already installed
# install.packages("ggplot2")

# Load the ggplot2 package
library(ggplot2)

# Now run your ggplot code
flights_dt %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 86400)  # 86400 seconds = 1 day


# Visualize departure times for a single day (filtering before January 2, 2013) in 10-minute bins
flights_dt %>% 
  filter(dep_time < ymd(20130102)) %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 600)  # 600 seconds = 10 minutes

# Analyze departures by day of the week:
# - Extract the weekday from departure times and plot a bar chart
flights_dt %>% 
  mutate(wday = wday(dep_time, label = TRUE)) %>% 
  ggplot(aes(x = wday)) +
  geom_bar()
