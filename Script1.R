# Learning Objectives:
# - Navigate RStudio interface
# - Understand basic R syntax and data types
# - Perform simple calculations and create variables
# - Import and examine economic datasets
# - Create basic visualizations relevant to economics
# ============================================================================

# RSTUDIO INTERFACE TOUR
# =======================
# The Four Panes:
# 1. Console (bottom-left): Where R executes commands
# 2. Script Editor (top-left): Where you write and save your code
# 3. Environment (top-right): Shows your data and variables
# 4. Files/Plots/Help (bottom-right): File browser, graphs, help documentation

# Best Practice: Always work with scripts!
# - Click File → New File → R Script
# - Write code in script, then run it line-by-line with Ctrl+Enter (Cmd+Enter on Mac)

# R AS A CALCULATOR
# =================
# R uses # for comments - anything after # is ignored

# Basic arithmetic operations
2 + 3        # Addition
10 - 4       # Subtraction
6 * 7        # Multiplication
20 / 4       # Division
2^3          # Exponent (2 to the power of 3)

# Order of operations matters - follows PEMDAS
2 + 3 * 4    # equals 14, not 20
(2 + 3) * 4  # equals 20 - use parentheses to control order

# VARIABLES AND ASSIGNMENT
# ========================
# Creating variables (use <- or =, but <- is preferred in R)
# EXAMPLE: Simple Interest Formula
# Interest = Principal × Rate × Time
principal <- 1000    # Initial amount
rate <- 0.05         # 5% interest rate (as decimal)
time <- 3            # 3 years
simple_interest <- principal * rate * time
#no space, another convention: simpleInterest
simple_interest      # Display result


# DATA TYPES AND STRUCTURES
# =========================
# VECTORS: The Building Block of R Data
# Numeric vectors
quantities <- c(100, 150, 120, 180)  # Units sold
prices <- c(5, 6, 5.5, 7)            # Price per unit

# Vector arithmetic (element-wise operations)
revenue <- quantities * prices        # Revenue = Quantity × Price
revenue
total_revenue <- sum(revenue)         # Sum all elements
print(paste("Total revenue:", total_revenue))

# Character vectors (text data)
countries <- c("USA", "UK", "Germany", "Japan")
countries

# Logical vectors (TRUE/FALSE values)
profitable <- c(TRUE, FALSE, TRUE, TRUE)
profitable

# BASIC VECTOR OPERATIONS
# =======================
# Vector indexing (accessing specific elements)
prices[1]         # First element (R uses 1-based indexing)
prices[2:4]       # Elements 2 through 4
prices[c(1,3)]    # Elements 1 and 3 (non-consecutive)

# Summary statistics functions
length(prices)    # Number of elements in vector
mean(prices)      # Average
median(prices)    # Middle value
min(prices)       # Minimum value
max(prices)       # Maximum value
sd(prices)        # Standard deviation
quantile(prices, probs = c(0.25, 0.5, 0.75))  # 25th, 50th, 75th percentiles

###################################################################
# STOP HERE
###################################################################

# DATA FRAMES: Like Excel Spreadsheets
# ====================================
# Create a data frame with economic data
economic_data <- data.frame(
  country = c("USA", "China", "Germany", "Japan", "UK"),        # Country names
  gdp = c(23.32, 17.73, 4.26, 4.94, 3.13),                    # GDP in trillions
  population = c(331, 1439, 83, 125, 67),                      # Population in millions
  unemployment = c(3.7, 5.2, 3.4, 2.8, 4.1)                   # Unemployment rate %
)

# Examine the data
economic_data           # Display entire data frame
str(economic_data)      # Structure: shows data types and dimensions
summary(economic_data)  # Summary statistics for each column

# DATA VISUALIZATION: Creating a Histogram
# ========================================
# Generate sample income data using random normal distribution
set.seed(123)  # For reproducible results (same random numbers each time)
income <- rnorm(1000, mean = 50000, sd = 15000)  # 1000 observations, mean=$50k, sd=$15k
income <- pmax(income, 10000)  # Set minimum income at $10,000

# Create histogram to show income distribution
hist(income, 
     main = "Distribution of Annual Income",    # Title
     xlab = "Income ($)",                       # X-axis label
     ylab = "Frequency",                        # Y-axis label
     col = "lightblue",                         # Bar color
     border = "white",                          # Bar border color
     breaks = 25)                               # Number of bars

# Add vertical lines for mean and median
abline(v = mean(income), col = "red", lwd = 2, lty = 2)       # Mean line
text(mean(income) + 8000, 80,                                 # Add text label
     paste("Mean = $", format(round(mean(income), 0), big.mark = ",")), 
     col = "red", cex = 0.9)

abline(v = median(income), col = "darkgreen", lwd = 2, lty = 2)  # Median line
text(median(income) - 8000, 70,                                  # Add text label
     paste("Median = $", format(round(median(income), 0), big.mark = ",")), 
     col = "darkgreen", cex = 0.9)

# GETTING HELP IN R
# =================
# Uncomment these lines to try them:
# ?mean              # Get help for mean function
# help(plot)         # Alternative way to get help
# ??average       # Search for functions containing "average"

# USEFUL RESOURCES
# ================
# - R Documentation: Press F1 or use ?function_name
# - AI tools: Great for troubleshooting
# - R for Data Science (free online): https://r4ds.had.co.nz/

# WHAT'S NEXT:
# - Data Import: Learn to read CSV, Excel files
# - Data Summary
# - Data Visualization
# - Statistical Tests: t-tests