# weather_analysis.R

# This R script performs a simple weather data analysis.
# It generates a sample CSV dataset, then creates line charts, histograms,
# and boxplots for temperature, humidity, and rainfall using ggplot2.

# 1. Install and load necessary libraries
# If you don't have ggplot2 installed, uncomment and run the line below:
# install.packages("ggplot2")
library(ggplot2)

# Ensure the 'lubridate' package is installed for date handling if needed,
# though base R date parsing is sufficient for this simple example.
# install.packages("lubridate") # Uncomment if you need advanced date/time handling
# library(lubridate)


# --- Section 1: Generate Sample Weather Data ---
# This section creates a dummy CSV file for demonstration purposes.
# In a real scenario, you would replace this with loading your actual data.

message("Generating sample weather data (weather_data.csv)...")

# Set a consistent seed for reproducibility of random data
set.seed(123)

# Define date range (e.g., one year of daily data)
start_date <- as.Date("2024-01-01")
end_date <- as.Date("2024-12-31")
dates <- seq(from = start_date, to = end_date, by = "day")
num_days <- length(dates)

# Generate synthetic weather data
# Temperature (Celsius): Mean 20, SD 5, with some seasonal variation
temperature <- round(rnorm(num_days, mean = 20 + 10 * sin(seq(0, 2 * pi, length.out = num_days)), sd = 5), 1)
temperature[temperature < -10] <- -10 # Min temperature cap
temperature[temperature > 40] <- 40   # Max temperature cap

# Humidity (Percent): Mean 70, SD 10
humidity <- round(rnorm(num_days, mean = 70, sd = 10), 0)
humidity[humidity < 0] <- 0   # Min humidity cap
humidity[humidity > 100] <- 100 # Max humidity cap

# Rainfall (mm): Mostly zeros, with occasional higher values
rainfall <- round(rlnorm(num_days, meanlog = 0.5, sdlog = 1) * (runif(num_days) < 0.2), 1) # ~20% chance of rain
rainfall[rainfall < 0] <- 0 # Ensure no negative rainfall

# Create a data frame
weather_df <- data.frame(
  Date = dates,
  Temperature_C = temperature,
  Humidity_Percent = humidity,
  Rainfall_mm = rainfall
)

# Extract month for boxplot analysis
weather_df$Month <- format(weather_df$Date, "%b") # Abbreviated month name
weather_df$Month <- factor(weather_df$Month, levels = unique(format(seq(start_date, end_date, by="month"), "%b"))) # Order months correctly

# Save the data to a CSV file
write.csv(weather_df, "weather_data.csv", row.names = FALSE)
message("Sample data saved to weather_data.csv")


# --- Section 2: Load Data (Simulating real-world scenario) ---
# In a real application, you would load your existing dataset here.
# For this example, we'll load the data we just generated.

message("Loading weather data from weather_data.csv...")
weather_data <- read.csv("weather_data.csv", stringsAsFactors = FALSE)
# Ensure Date column is in Date format for proper plotting
weather_data$Date <- as.Date(weather_data$Date)
# Re-factor Month if needed after loading from CSV (important for plot order)
weather_data$Month <- factor(weather_data$Month, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
message("Data loaded successfully.")


# --- Section 3: Data Visualization using ggplot2 ---
# This section generates various plots and saves them as PNG files.

# Ensure a 'plots' directory exists
if (!dir.exists("plots")) {
  dir.create("plots")
}

message("Generating plots and saving them to the 'plots' directory...")

# Plot 1: Line Chart for Temperature over Time
p_temp_line <- ggplot(weather_data, aes(x = Date, y = Temperature_C)) +
  geom_line(color = "darkblue", alpha = 0.7) +
  labs(title = "Daily Temperature Over Time",
       x = "Date",
       y = "Temperature (°C)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))
ggsave("plots/temperature_line_chart.png", p_temp_line, width = 10, height = 6, dpi = 300)
message("  - Temperature line chart saved.")

# Plot 2: Histogram for Temperature Distribution
p_temp_hist <- ggplot(weather_data, aes(x = Temperature_C)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Daily Temperature",
       x = "Temperature (°C)",
       y = "Frequency") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))
ggsave("plots/temperature_histogram.png", p_temp_hist, width = 8, height = 6, dpi = 300)
message("  - Temperature histogram saved.")

# Plot 3: Histogram for Humidity Distribution
p_humidity_hist <- ggplot(weather_data, aes(x = Humidity_Percent)) +
  geom_histogram(binwidth = 5, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of Daily Humidity",
       x = "Humidity (%)",
       y = "Frequency") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))
ggsave("plots/humidity_histogram.png", p_humidity_hist, width = 8, height = 6, dpi = 300)
message("  - Humidity histogram saved.")

# Plot 4: Histogram for Rainfall Distribution
# Note: Rainfall data might be skewed heavily towards 0
p_rainfall_hist <- ggplot(weather_data, aes(x = Rainfall_mm)) +
  geom_histogram(binwidth = 1, fill = "lightcoral", color = "black") +
  labs(title = "Distribution of Daily Rainfall",
       x = "Rainfall (mm)",
       y = "Frequency") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))
ggsave("plots/rainfall_histogram.png", p_rainfall_hist, width = 8, height = 6, dpi = 300)
message("  - Rainfall histogram saved.")

# Plot 5: Boxplot for Temperature by Month
p_temp_boxplot <- ggplot(weather_data, aes(x = Month, y = Temperature_C, fill = Month)) +
  geom_boxplot() +
  labs(title = "Temperature Distribution by Month",
       x = "Month",
       y = "Temperature (°C)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), # Rotate month labels for readability
        legend.position = "none", # Hide legend as month is on x-axis
        plot.title = element_text(hjust = 0.5, face = "bold"))
ggsave("plots/temperature_boxplot_by_month.png", p_temp_boxplot, width = 10, height = 6, dpi = 300)
message("  - Temperature boxplot by month saved.")

message("Analysis complete. Check the 'plots' directory for the generated visualizations.")

# Optional: Display plots if running in an interactive R session
# print(p_temp_line)
# print(p_temp_hist)
# print(p_humidity_hist)
# print(p_rainfall_hist)
# print(p_temp_boxplot)