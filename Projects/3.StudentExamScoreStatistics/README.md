# R Student Exam Score Statistics
This R script provides a comprehensive tool for basic statistical analysis of student exam scores. It calculates key descriptive statistics, performs a hypothesis test, and visualizes the score distribution.

For demonstration, the script generates a sample dataset of 100 exam scores. In a real-world application, you would load your actual student score data from a file (e.g., CSV).

## Features
- Sample Data Generation: Automatically creates a set of 100 synthetic student exam scores (ranging from 50 to 100) for analysis.

- Average Score Calculation: Computes the mean (average) of the exam scores.

- Variance Calculation: Determines the variance and standard deviation of the scores, indicating their spread.

- One-Sample t-test: Performs a statistical test to determine if the sample mean of the scores is significantly different from a hypothetical population mean (defaulted to 70).

- Score Distribution Chart: Generates and saves a histogram using ggplot2 to visualize the frequency distribution of the scores.

- Informative Output: Prints all calculated statistics, t-test results, and conclusions directly to the console.

- Automated Plot Saving: The generated histogram is automatically saved as a PNG image file in a plots/ directory.


## Prerequisites
To run this application, you need to have:

- R Installed:

  - Download and install R from CRAN.

  - It's recommended to also install RStudio Desktop for a more user-friendly development environment.

- ggplot2 Package:

  - The script requires the ggplot2 package for plotting. If you don't have it, you can install it from within R by running:

  ```text
  install.packages("ggplot2")
  ```

## How to Run
- Save the Script: Save the provided R code into a file named app.R.

- Open R or RStudio:

  - You can open RStudio and open the app.R file.

  - Alternatively, open your terminal or command prompt.

- Navigate to Directory: Change your current directory to where you saved app.R.

- Execute the Script:

  - From RStudio: Open the app.R file and click the "Source" button, or select all code and run it.

  - From Terminal:
  ```text
  Rscript app.R
  ```

## Expected Output
The script will print the calculated statistics and t-test results to the console, similar to this:
```text
Generating sample student exam scores.
Generated 100 sample scores.

Calculating basic statistics...
Average Score: 76.50
Variance of Scores: 228.32
Standard Deviation: 15.11

Performing One-Sample t-test (mu = 70)...
  Test statistic (t): 4.31
  Degrees of Freedom: 99
  P-value: 0.0000
  95% Confidence Interval: (73.46, 79.54)
  Sample Mean: 76.50
  Conclusion: The average score (76.50) is statistically significantly different from 70.00 (p < 0.05).

Generating score distribution histogram...
Score distribution histogram saved to plots/score_distribution_histogram.png

Analysis complete!
```

Additionally, a plots/ directory will be created in the same location as your script, containing the score_distribution_histogram.png image.


## How It Works
- Data Generation (Section 1):

  - set.seed() ensures that the generated random scores are the same every time you run the script, making the analysis reproducible.

  - rnorm() is used to create normally distributed scores, which are then rounded and clipped to a realistic exam score range (50-100).

  - These scores are stored in a data frame for easy manipulation with ggplot2.

- Basic Statistics (Section 2):

  - mean() calculates the arithmetic average of the scores.

  - var() calculates the sample variance, and sd() calculates the sample standard deviation, providing measures of the spread of the scores.

- One-Sample t-test (Section 3):

  - t.test(scores_df$Score, mu = 70) performs a one-sample t-test. This test checks if the true mean of the population from which the sample was drawn is equal to a specified value (here, 70).

  - The results include the t-statistic, degrees of freedom, p-value, confidence interval, and the sample mean.

  - The p-value is used to draw a conclusion about the statistical significance of the difference between the sample mean and the hypothesized mean.

- Score Distribution Chart (Section 4):

  - A plots/ directory is created to store the generated image.

  - ggplot2 is used to create a histogram:

    - ggplot() initializes the plot with the scores_df data and maps Score to the x-axis.

    - geom_histogram() creates the histogram bars, with binwidth controlling the width of each bar (e.g., 5-point score intervals).

    - labs() sets the title and axis labels.

    - theme_minimal() applies a clean visual style.

    - scale_x_continuous() customizes the x-axis ticks and limits.

    - ggsave() saves the plot as a PNG image.
