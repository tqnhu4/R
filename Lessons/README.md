# R-tutorials

# 🧠 7-Day R Learning Roadmap for Beginners
Welcome to your accelerated R learning journey! This roadmap is meticulously crafted to guide absolute beginners through the fundamentals of R programming and data analysis within seven days, emphasizing practical application and rapid skill acquisition.

Each day focuses on a distinct set of core R concepts, complete with illustrative examples and a culminating practical project to solidify your understanding.

## 📅 Day 1: R & RStudio Setup, Basics, and Data Types
Today is all about getting your R environment ready and understanding the absolute core principles of R.

### Content:
- **Introduction to R:** What R is, why it's used for data science and statistics, and its open-source nature.
- **Installation & Environment Setup:**
  - Detailed steps to install R (the language interpreter).
  - Detailed steps to install RStudio Desktop (the recommended Integrated Development Environment).
  - A brief tour of the RStudio interface (Console, Script Editor, Environment, Files/Plots/Packages/Help panes).
- **Basic R Syntax & Operations:**
  - Running commands in the console.
  - Assigning values to variables (<- or =).
  - Comments (#).
  - Basic arithmetic operations.
- **Core Data Types:**
  - Numeric (numeric, integer).
  - Character (character, strings).
  - Logical (logical, Booleans: TRUE/FALSE).
  - Understanding NA (Not Available) for missing values.
### Example:
```r
# Day 1: R & RStudio Setup, Basics, and Data Types

# --- 1. Basic Operations ---
# Assigning values to variables
my_number <- 10
my_text <- "Hello R!"
is_active <- TRUE

# Print values
print(my_number)
print(my_text)
print(is_active)

# Basic arithmetic
result_sum <- 5 + 3
result_product <- my_number * 2
print(result_sum)
print(result_product)

# --- 2. Data Types & Checking Types ---
# Numeric
x <- 10.5
y <- 20 # R treats this as numeric by default. To make it an integer:
z <- 20L # L suffix makes it an explicit integer

class(x)
class(y)
class(z)

# Character (String)
my_string <- "Learning R is fun!"
class(my_string)

# Logical (Boolean)
is_raining <- FALSE
class(is_raining)

# Missing Values
data_with_na <- c(1, 2, NA, 4)
is.na(data_with_na) # Check which elements are NA

# --- 3. Simple Interaction ---
# You can use `readline()` for basic user input, but it's more common in scripting.
# For now, focus on writing and running code in the script editor.
# For example, paste the above code into a new R script in RStudio and run line by line or all at once.
```

## 📅 Day 2: Vectors & Basic Data Manipulation
Today, you'll learn about vectors, the fundamental data structure in R, and start performing basic operations on them.

### Content:
- **Vectors:**
  - Creating vectors using c() (combine function).
  - Accessing elements by index ([]).
  - Vectorized operations (R's power for performing operations on entire vectors at once).
  - Generating sequences (:, seq()).
  - Logical indexing for subsetting vectors.
- **Basic Vector Operations:**
  - length(): Get number of elements.
  - sum(), mean(), median(), min(), max().
  - sort(), order().
### Example:

```r
# Day 2: Vectors & Basic Data Manipulation

# --- 1. Creating Vectors ---
# Numeric vector
ages <- c(23, 28, 35, 42, 28)
print(ages)

# Character vector
names <- c("Alice", "Bob", "Charlie", "David", "Eve")
print(names)

# Logical vector
is_active_users <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
print(is_active_users)

# Mixed types (R will coerce to the most general type, e.g., numeric to character)
mixed_vector <- c(1, "hello", TRUE)
print(mixed_vector) # Notice all become character strings

# --- 2. Accessing Vector Elements ---
# Access by position (1-based indexing in R)
first_age <- ages[1]
print(first_age)
third_name <- names[3]
print(third_name)

# Access multiple elements
first_three_ages <- ages[1:3]
print(first_three_ages)
selected_names <- names[c(1, 5)] # Non-contiguous elements
print(selected_names)

# --- 3. Vectorized Operations ---
temperatures_c <- c(0, 10, 20, 30)
temperatures_f <- (temperatures_c * 9/5) + 32
print(temperatures_f)

# --- 4. Generating Sequences ---
numbers_1_to_5 <- 1:5
print(numbers_1_to_5)

even_numbers <- seq(from = 2, to = 10, by = 2)
print(even_numbers)

# --- 5. Logical Indexing (Subsetting) ---
scores <- c(85, 92, 78, 95, 88)
high_scores <- scores[scores > 90]
print(high_scores)

# --- 6. Basic Vector Statistics ---
mean_age <- mean(ages)
max_score <- max(scores)
sorted_scores <- sort(scores)
print(paste("Mean age:", mean_age))
print(paste("Max score:", max_score))
print(paste("Sorted scores:", sorted_scores))
```

---

## 📅 Day 3: Factors & Data Frames (The Workhorse of R)
Today, you'll learn about factors (for categorical data) and data frames, which are crucial for storing tabular data.

### Content:
- **Factors:**
  - Creating factors (factor()).
  - Understanding levels.
  - Ordered factors.
  - Useful for categorical variables (e.g., "Male"/"Female", "Low"/"Medium"/"High").
- **Data Frames:**
  - Creating data frames (data.frame()).
  - Accessing columns ($, [[, []).
  - Accessing rows.
  - Adding and deleting columns.
  - Basic data frame info (dim(), nrow(), ncol(), colnames(), summary()).
- **Basic Subsetting of Data Frames:**
  - Selecting rows and columns by name or position.
  - Filtering rows based on conditions.
### Example:

```r
# Day 3: Factors & Data Frames

# --- 1. Factors ---
# Creating a factor from a character vector
gender_data <- c("Male", "Female", "Female", "Male", "Male")
gender_factor <- factor(gender_data)
print(gender_factor)
print(levels(gender_factor))

# Creating an ordered factor
education_levels <- c("High School", "College", "High School", "Masters")
education_factor <- factor(education_levels,
                           levels = c("High School", "College", "Masters", "PhD"),
                           ordered = TRUE)
print(education_factor)
print(is.ordered(education_factor))

# --- 2. Data Frames ---
# Creating a data frame
employee_data <- data.frame(
  ID = c(101, 102, 103, 104, 105),
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(28, 35, 22, 45, 30),
  Department = factor(c("HR", "IT", "Sales", "HR", "IT")),
  Salary = c(60000, 85000, 55000, 70000, 90000)
)

print(employee_data)
class(employee_data)

# --- 3. Accessing Data Frame Elements ---
# Accessing a column by name using '$' (most common)
employee_names <- employee_data$Name
print(employee_names)

# Accessing a column using '[[]]' (returns a vector)
employee_salaries <- employee_data[["Salary"]]
print(employee_salaries)

# Accessing columns using '[]' (returns a data frame)
names_and_ages <- employee_data[c("Name", "Age")]
print(names_and_ages)

# Accessing rows by position
first_employee <- employee_data[1,] # Comma after 1 means all columns
print(first_employee)

# Accessing a specific cell (row, column)
charlie_age <- employee_data[3, "Age"]
print(paste("Charlie's age:", charlie_age))

# --- 4. Data Frame Information ---
dim(employee_data)
nrow(employee_data)
ncol(employee_data)
colnames(employee_data)
summary(employee_data)

# --- 5. Filtering Data Frames ---
# Filter employees in the 'IT' department
it_employees <- employee_data[employee_data$Department == "IT", ]
print(it_employees)

# Filter employees older than 30
older_employees <- employee_data[employee_data$Age > 30, c("Name", "Age", "Department")]
print(older_employees)
```

---

## 📅 Day 4: Conditional Logic & Loops
Today, you'll learn how to control the flow of your R programs and automate repetitive tasks.

### Content:
- **Conditional Statements:**
  - if, else if, else: For making decisions.
  - ifelse(): A vectorized version for conditional assignments.
  - switch(): For multiple distinct conditions.
- **Loops:**
  - for loop: Iterating a fixed number of times or over elements in a collection.
  - while loop: Repeating as long as a condition is true.
  - break and next: Controlling loop execution.
  - Note: In R, using vectorized operations or apply family functions is often preferred over explicit loops for performance.
### Example:

```r
# Day 4: Conditional Logic & Loops

# --- 1. Conditional Statements ---
# if-else if-else
score <- 78
if (score >= 90) {
  print("Grade: A")
} else if (score >= 80) {
  print("Grade: B")
} else if (score >= 70) {
  print("Grade: C")
} else {
  print("Grade: F")
}

# ifelse() - Vectorized conditional
temperatures <- c(25, 18, 32, 10, 20)
weather_status <- ifelse(temperatures > 25, "Hot", "Mild")
print(weather_status)

# switch()
day_number <- 3
day_name <- switch(day_number,
                   "Monday",
                   "Tuesday",
                   "Wednesday",
                   "Thursday",
                   "Friday",
                   "Saturday",
                   "Sunday")
print(day_name)

# --- 2. Loops ---
# for loop - iterating over a sequence
for (i in 1:5) {
  print(paste("Loop iteration:", i))
}

# for loop - iterating over a vector
fruits <- c("apple", "banana", "cherry")
for (fruit in fruits) {
  print(paste("I love", fruit))
}

# while loop
countdown <- 3
while (countdown > 0) {
  print(paste("Countdown:", countdown))
  countdown <- countdown - 1
}
print("Blast off!")

# break and next
for (i in 1:10) {
  if (i == 3) {
    next # Skip to the next iteration
  }
  if (i == 7) {
    break # Exit the loop entirely
  }
  print(paste("Current number:", i))
}
```

## 📅 Day 5: Functions & Packages
Today, you'll learn to write your own reusable R functions and leverage external packages to extend R's capabilities.

### Content:
- **Functions:**
  - Defining your own R functions (function()).
  - Parameters and return values.
  - Default arguments.
  - Scope of variables in functions.
- **Packages:**
  - Understanding what R packages are (collections of functions, data, and compiled code).
  - Installing packages (install.packages()).
  - Loading packages (library()).
  - Exploring basic functions from popular packages (e.g., dplyr for data manipulation, ggplot2 for plotting - briefly).
### Example:

```r
# Day 5: Functions & Packages

# --- 1. Defining Functions ---
# Simple function
calculate_square <- function(x) {
  return(x * x)
}

result_square <- calculate_square(5)
print(paste("Square of 5:", result_square))

# Function with multiple parameters and default argument
greet_user <- function(name, greeting = "Hello") {
  message <- paste(greeting, name, "!")
  return(message)
}

message1 <- greet_user("Alice")
message2 <- greet_user("Bob", "Hi there")
print(message1)
print(message2)

# --- 2. Packages ---
# You need to install packages once. Uncomment and run if you haven't:
# install.packages("dplyr") # For data manipulation
# install.packages("ggplot2") # For plotting

# Load packages
library(dplyr)
library(ggplot2)

# Example using dplyr (very common for data manipulation)
data <- data.frame(
  ID = 1:5,
  Value = c(10, 25, 12, 30, 18),
  Category = c("A", "B", "A", "C", "B")
)

# Use dplyr's filter and select functions
filtered_data <- data %>%
  filter(Value > 15) %>%
  select(ID, Category)

print(filtered_data)

# Example using ggplot2 (brief introduction, more on Day 7)
# Create a simple scatter plot
# ggplot(data, aes(x = ID, y = Value)) +
#   geom_point() +
#   labs(title = "Simple Scatter Plot", x = "ID", y = "Value")
# (Run this line by line in RStudio to see the plot in the 'Plots' pane)

# --- 3. Exploring a Package ---
# To see help for a function in a package:
?filter # Shows help for dplyr's filter function if dplyr is loaded
```

## 📅 Day 6: Reading/Writing Data & Data Cleaning Basics
Today, you'll learn how to bring external data into R and perform some initial data cleaning steps.

### Content:
- **Reading Data:**
  - CSV files: read.csv(), read_csv() (from readr package).
  - Excel files: read_excel() (from readxl package).
- **Writing Data:**
  - CSV files: write.csv(), write_csv() (from readr package).
- **Basic Data Cleaning:**
  - Handling missing values (NA) - is.na(), na.omit(), complete.cases().
  - Removing duplicate rows.
  - Renaming columns.
  - Changing data types (as.numeric(), as.character(), as.factor()).
### Example:

```r
# Day 6: Reading/Writing Data & Data Cleaning Basics

# Ensure necessary packages are installed
# install.packages("readr")
# install.packages("readxl") # For Excel files

library(readr)
library(readxl)
library(dplyr) # For data manipulation functions

# --- 1. Creating a Dummy CSV File for Reading ---
# In a real scenario, you'd have an existing CSV file.
# For this example, let's create one programmatically.
dummy_data <- data.frame(
  Name = c("John Doe", "Jane Smith", "Peter Jones", "John Doe", NA),
  Age = c(30, 25, 40, 30, 28),
  City = c("New York", "London", "Paris", "New York", "Berlin"),
  Score = c(95, 88, NA, 95, 70),
  stringsAsFactors = FALSE # Prevent R from converting strings to factors by default
)
write_csv(dummy_data, "my_data.csv")
print("Dummy data saved to 'my_data.csv'")

# --- 2. Reading Data ---
# Reading a CSV file
my_data <- read_csv("my_data.csv")
print("\nData read from my_data.csv:")
print(my_data)

# Reading an Excel file (requires a dummy Excel file or replace with your own path)
# Assuming you have "my_excel_data.xlsx" in your working directory with a sheet named "Sheet1"
# excel_data <- read_excel("my_excel_data.xlsx", sheet = "Sheet1")
# print("\nData read from my_excel_data.xlsx:")
# print(excel_data)

# --- 3. Basic Data Cleaning ---
# Check for missing values
is.na(my_data$Score)
sum(is.na(my_data$Score)) # Number of missing scores

# Option A: Remove rows with any NA
cleaned_data_no_na <- na.omit(my_data)
print("\nData after removing rows with any NA:")
print(cleaned_data_no_na)

# Option B: Impute (replace) missing values (e.g., with mean)
mean_score <- mean(my_data$Score, na.rm = TRUE) # na.rm = TRUE to ignore NAs
my_data$Score[is.na(my_data$Score)] <- mean_score
print("\nData after imputing missing scores with mean:")
print(my_data)

# Remove duplicate rows
unique_data <- my_data %>% distinct() # Uses dplyr's distinct()
print("\nData after removing duplicates:")
print(unique_data)

# Rename a column (using dplyr's rename)
renamed_data <- unique_data %>%
  rename(CustomerName = Name)
print("\nData after renaming 'Name' to 'CustomerName':")
print(renamed_data)

# Change data type (e.g., from character to numeric, or vice-versa)
# In this dummy_data, Age is already numeric, but if it were character:
# my_data$Age <- as.numeric(my_data$Age)
# class(my_data$Age)

# --- 4. Writing Data ---
# Write the cleaned data to a new CSV file
write_csv(unique_data, "cleaned_data.csv")
print("\nCleaned data saved to 'cleaned_data.csv'")

# Clean up (optional: remove the dummy files after testing)
# file.remove("my_data.csv")
# file.remove("cleaned_data.csv")
```

## 📅 Day 7: Practical Project: Basic Data Analysis & Visualization
Today is about consolidating your knowledge by performing a basic data analysis and creating visualizations.

### Content:
- **Project:** Analyze a small dataset (e.g., built-in dataset like mtcars or a simple CSV you create/download).
- **Steps:**
  - Load Data: Use read.csv() or read_csv().
  - Explore Data: Use summary(), str(), head(), tail(), colnames().
  - Basic Data Manipulation (with dplyr):
    - filter(): Select rows based on conditions.
    - select(): Choose specific columns.
    - mutate(): Create new columns.
    - group_by() and summarize(): Aggregate data.
  - Basic Visualization (with ggplot2):
    - Scatter plots: For relationships between two numeric variables.
    - Bar plots: For categorical data counts or summaries.
    - Histograms: For distribution of a single numeric variable.
    - Customizing plots (labels, titles, colors).
### Example Project: Analyzing the mtcars Dataset

```r
# Day 7: Practical Project: Basic Data Analysis & Visualization

# Ensure necessary packages are loaded
library(dplyr)    # For data manipulation
library(ggplot2)  # For data visualization

# --- 1. Load Data ---
# We'll use the built-in 'mtcars' dataset for simplicity.
# If you created a CSV on Day 6, you could use:
# my_data <- read_csv("cleaned_data.csv")
data(mtcars) # Loads the mtcars dataset into your R session
my_cars_data <- mtcars # Make a copy to work with

print("--- Original mtcars Data (first 6 rows) ---")
print(head(my_cars_data))
print("\n--- Structure of mtcars ---")
str(my_cars_data)
print("\n--- Summary Statistics of mtcars ---")
summary(my_cars_data)

# --- 2. Basic Data Manipulation with dplyr ---
# Let's say we want to analyze cars with more than 4 cylinders
# and see their miles per gallon (mpg) and horsepower (hp).

cars_filtered <- my_cars_data %>%
  filter(cyl > 4) %>% # Filter for cars with more than 4 cylinders
  select(mpg, cyl, hp, wt) %>% # Select specific columns
  mutate(hp_per_wt = hp / wt) # Create a new column: horsepower per weight

print("\n--- Filtered and Mutated Cars Data (first 6 rows) ---")
print(head(cars_filtered))

# Group by cylinder count and calculate average mpg and hp
avg_stats_by_cyl <- my_cars_data %>%
  group_by(cyl) %>% # Group by cylinder
  summarise(
    Avg_MPG = mean(mpg),
    Avg_HP = mean(hp),
    Count = n() # Count number of cars in each group
  )

print("\n--- Average MPG and HP by Cylinder Count ---")
print(avg_stats_by_cyl)

# --- 3. Basic Visualization with ggplot2 ---

# Scatter Plot: Relationship between Weight (wt) and Miles Per Gallon (mpg)
scatter_plot <- ggplot(my_cars_data, aes(x = wt, y = mpg)) +
  geom_point(color = "blue", size = 3, alpha = 0.7) + # Add points
  geom_smooth(method = "lm", se = FALSE, color = "red") + # Add a linear regression line
  labs(
    title = "MPG vs. Weight of Cars",
    x = "Weight (1000 lbs)",
    y = "Miles Per Gallon"
  ) +
  theme_minimal() # A clean theme
print(scatter_plot) # This will display the plot in RStudio's Plots pane

# Bar Plot: Average MPG by Number of Cylinders
bar_plot <- ggplot(avg_stats_by_cyl, aes(x = factor(cyl), y = Avg_MPG, fill = factor(cyl))) +
  geom_bar(stat = "identity") + # Use 'identity' because we're providing y-values directly
  labs(
    title = "Average MPG by Number of Cylinders",
    x = "Number of Cylinders",
    y = "Average MPG",
    fill = "Cylinders"
  ) +
  theme_bw() # Another clean theme
print(bar_plot)

# Histogram: Distribution of Horsepower
hist_plot <- ggplot(my_cars_data, aes(x = hp)) +
  geom_histogram(binwidth = 20, fill = "lightblue", color = "black") +
  labs(
    title = "Distribution of Horsepower",
    x = "Horsepower (hp)",
    y = "Frequency"
  ) +
  theme_classic()
print(hist_plot)

# --- End of Project ---
```

## 💡 Tips for Quick Learning and Immediate Application:
- **Practice in RStudio:** Use the RStudio script editor and console extensively. Running code line by line is a great way to understand what each command does.
- **Experiment with Data:** Once you learn to load data, try applying different functions and manipulations to see the results. Use the built-in datasets like mtcars, iris, quakes for practice.
- **Use ? for Help:** R's built-in help is excellent. Type ?function_name (e.g., ?mean) in the console to get detailed documentation.
- **Leverage Packages Early:** Don't be afraid to use dplyr and ggplot2 early on. They make data manipulation and visualization much more intuitive and powerful.
- **Search Online:** When you encounter problems or need to find a specific function, Google your R questions. Websites like Stack Overflow and R-bloggers are invaluable.
- **Cheatsheets:** RStudio provides excellent cheatsheets for dplyr, ggplot2, etc., which are great quick references.
