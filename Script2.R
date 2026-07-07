# Learning Objectives:
# - Calculate summary statistics using multiple functions
# - Create histograms with proper labeling
# ============================================================================

# ============================================================================
# PART 1: WHERE TO STORE THE CSV FILE
# ============================================================================
# 1. You can check your current working directory with
getwd()
# 2. Place R_Section2_practicedata.csv in your **working directory**.
#    - This is usually the folder where your R script is saved.

# 3. If you want to change the working directory:
# setwd("C:/path/to/folder")   # Windows users: use forward slashes or double backslashes
# setwd("/Users/yourname/folder")  # Mac users: path starts with /Users/

# ============================================================================
# PART 2: IMPORTING THE CSV INTO R
# ============================================================================

# Load a package which provides enhanced data frame functionality
# install.packages("tidyverse")   # Uncomment this line if tidyverse is not installed
library(tidyverse)

# Read CSV file from working directory and convert to tibble format
student_scores <- as_tibble(read.csv("R_Section2_practicedata.csv"))

# Display the first 6 rows of the dataset to check if import was successful
head(student_scores)

# Show the structure of the data (variable types, number of observations)
str(student_scores)

# Generate basic summary statistics for all numeric columns automatically
summary(student_scores)

# ============================================================================
# PART 3: ACCESSING SPECIFIC COLUMNS
# ============================================================================

# Extract the Math_Score column as a vector using the $ operator
student_scores$Math_Score

# Extract the Reading_Score column as a vector using the $ operator
student_scores$Reading_Score

# Extract the Science_Score column as a vector using the $ operator
student_scores$Science_Score

# ============================================================================
# PART 4: CALCULATING INDIVIDUAL SUMMARY STATISTICS
# ============================================================================

# Calculate the arithmetic mean (average) for Math scores
mean(student_scores$Math_Score)

# Calculate the standard deviation (measure of spread) for Reading scores
sd(student_scores$Reading_Score)

# Calculate the variance (standard deviation squared) for Science scores
var(student_scores$Science_Score)

# Calculate the median for Math scores
median(student_scores$Math_Score)

# Calculate the minimum value in Math scores
min(student_scores$Math_Score)
# Find which student (return a row number) has the minimum value in Math scores
which.min(student_scores$Math_Score)
# Find the exact Student label with the minimum value in Math scores
student_scores$Student[which.min(student_scores$Math_Score)]

# Calculate the maximum value in Math scores
max(student_scores$Math_Score)

# Calculate the range (max - min) for Math scores
range(student_scores$Math_Score)

# Calculate specific quantiles (25th and 75th percentiles) for Math scores
quantile(student_scores$Math_Score, c(0.25, 0.75))

# Calculate the interquartile range (IQR = Q3 - Q1) for Math scores
IQR(student_scores$Math_Score)

# Calculate correlation coefficient between Math and Science scores (-1 to 1 scale)
cor(student_scores$Math_Score, student_scores$Science_Score)

# Store correlation between Math and Science in a variable "math_science_corr"
math_science_corr <- cor(student_scores$Math_Score, student_scores$Science_Score)

# Display the stored correlation value
math_science_corr

# Create correlation matrix showing all pairwise correlations
cor(student_scores)

# ============================================================================
# PART 5: STORING MULTIPLE STATISTICS IN VECTORS
# ============================================================================

# Create a vector containing minimum, maximum, mean, median, and standard deviation for Math scores
summary_stats_math <- c(min(student_scores$Math_Score),
                        max(student_scores$Math_Score),
                        mean(student_scores$Math_Score),
                        median(student_scores$Math_Score),
                        sd(student_scores$Math_Score))

# Display the vector of Math statistics
summary_stats_math

# Create named vector for better interpretation of Math statistics
named_stats_math <- c("Min" = min(student_scores$Math_Score),
                      "Max" = max(student_scores$Math_Score),
                      "Mean" = mean(student_scores$Math_Score),
                      "Median" = median(student_scores$Math_Score),
                      "StdDev" = sd(student_scores$Math_Score))

# Display the named vector of Math statistics
named_stats_math

# ============================================================================
# PART 6: USING THE SUMMARY() FUNCTION FOR COMPREHENSIVE STATISTICS
# ============================================================================

# Generate six-number summary (Min, 1st Qu, Median, Mean, 3rd Qu, Max) for Math scores
summary(student_scores$Math_Score)

# Store summary statistics in a variable "math_summary"
math_summary <- summary(student_scores$Math_Score)

# Display the stored summary statistics for Math scores
math_summary

# Access specific elements from summary output (e.g., minimum value from Math summary)
math_summary["Min."]

# Access specific elements from summary output (e.g., maximum value from Math summary)
math_summary["Max."]

# Access specific elements from summary output (e.g., median value from Math summary)
math_summary["Median"]

# ============================================================================
# PART 7: BASIC HISTOGRAMS
# ============================================================================
# Purpose: Learn hist() function with titles, axis labels

# Create histogram for Math scores with title and axis labels
hist(student_scores$Math_Score,
     main = "Histogram of Math Scores",      # Main title at top of plot
     xlab = "Score",                         # Label for x-axis
     ylab = "Frequency")                     # Label for y-axis

# Create histogram for Reading scores with title and axis labels
hist(student_scores$Reading_Score,
     main = "Histogram of Reading Scores",   # Main title at top of plot
     xlab = "Score",                         # Label for x-axis
     ylab = "Frequency")                     # Label for y-axis

# Create histogram with additional customization options for Science scores
hist(student_scores$Science_Score,
     main = "Distribution of Science Scores",   # Main title
     xlab = "Science Score",                    # X-axis label
     ylab = "Number of Students",            # Y-axis label
     col = "lightblue",                      # Fill color for bars
     border = "black",                       # Border color for bars
     breaks = 10)                           # Number of bins/bars

# Tip: In RStudio, use Plots > Export > Save as PDF if you want a PDF file


# ============================================================================
# REVIEW OF KEY FUNCTIONS LEARNED
# ============================================================================

# Data import and inspection functions:
# - read.csv() : imports CSV files
# - head() : shows first few rows
# - str() : shows structure of data
# - summary() : provides summary statistics for all columns

# Statistical functions:
# - mean() : calculates average
# - median() : calculates middle value
# - sd() : calculates standard deviation
# - var() : calculates variance
# - min() : finds minimum value
# - max() : finds maximum value
# - range() : finds min and max values
# - quantile() : calculates specific percentiles
# - IQR() : calculates interquartile range
# - cor() : calculates correlation between variables

# Data organization functions:
# - $ operator : accesses columns by name
# - c() : creates vectors
# - names() : assigns or retrieves names

# Visualization functions:
# - hist() : creates histograms

# ============================================================================
# END OF SCRIPT 
# ============================================================================