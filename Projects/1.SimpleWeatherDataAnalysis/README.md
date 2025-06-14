# R Simple Weather Data Analysis
This R script provides a basic framework for analyzing weather data. It demonstrates how to load a CSV dataset and generate common statistical visualizations such as line charts, histograms, and boxplots using the powerful ggplot2 package.

For demonstration purposes, the script includes a section to generate a sample weather_data.csv file. In a real-world scenario, you would use your own weather dataset.

## Features
- Sample Data Generation: Automatically creates a weather_data.csv file with synthetic daily temperature, humidity, and rainfall data for a year.

- CSV Data Loading: Reads weather data from a specified CSV file.

- Line Chart: Visualizes temperature trends over time.

- Histograms: Displays the distribution of temperature, humidity, and rainfall.

- Boxplots: Shows the distribution of temperature across different months, highlighting seasonal variations and outliers.

- ggplot2 Integration: Utilizes the ggplot2 package for creating high-quality, customizable plots.

- Automated Plot Saving: All generated plots are saved as PNG image files in a plots/ directory.

## Prerequisites
To run this application, you need to have:

- R Installed:

  - Download and install R from CRAN.

  - It's recommended to also install RStudio Desktop for a more user-friendly development environment.

  ```text
  sudo apt update
  sudo apt install r-base
  ```  

- ggplot2 Package:

  - The script requires the ggplot2 package. If you don't have it, you can install it from within R by running:

    ```text
    R
    ```

    ```r
    >
    ```

    ```r
    install.packages("ggplot2")
    ```

    Escape terminal:
    ```r
    q()
    ```

  - The script also uses lubridate for date handling, but basic R date functions are used in the main code to minimize dependencies. If you uncomment the lubridate line, ensure it's installed.    


## How to Run
- Save the Script: Save the provided R code into a file named weather_analysis.R.

- Open R or RStudio:

  - You can open RStudio and open the weather_analysis.R file.

  - Alternatively, open your terminal or command prompt.

- Navigate to Directory: Change your current directory to where you saved weather_analysis.R.

- Execute the Script:

  - From RStudio: Open the weather_analysis.R file and click the "Source" button, or select all code and run it.

  - From Terminal:  

```text
Rscript app.R  
```

## Expected Output
- The script will first create a weather_data.csv file in the same directory.

- It will then create a plots/ directory.

- Inside the plots/ directory, you will find five PNG image files:

  - temperature_line_chart.png

  - temperature_histogram.png

  - humidity_histogram.png

  - rainfall_histogram.png

  - temperature_boxplot_by_month.png

## How It Works
- Data Generation (Section 1):

  - A set.seed() is used for reproducibility of the random data.

  - Dates for a full year are generated.

  - Synthetic Temperature_C, Humidity_Percent, and Rainfall_mm values are created using random normal/lognormal distributions, with some seasonality for temperature.

  - A Month column is derived from the Date for categorical plotting.

  - This data is then saved to weather_data.csv.  

- Data Loading (Section 2):

  - read.csv("weather_data.csv", ...) is used to load the dataset.

  - as.Date() ensures the Date column is correctly interpreted as dates for time-series plotting.

  - The Month column is re-factored to ensure correct ordering in plots.  

- Data Visualization (Section 3):

  - The plots/ directory is created if it doesn't exist.

  - ggplot2 is used to define and create each plot:

    - ggplot() initializes the plot with data and aesthetics (aes()).

    - geom_line(), geom_histogram(), and geom_boxplot() are used to define the type of plot.

    - labs() sets the title and axis labels.

    - theme_minimal() applies a clean theme.

    - ggsave() saves each plot to the plots/ directory as a PNG file with specified dimensions and resolution.  





