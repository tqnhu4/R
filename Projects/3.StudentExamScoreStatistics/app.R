# app.R

# This R script performs basic statistical analysis on student exam scores.
# It calculates the average, variance, performs a one-sample t-test,
# and displays a score distribution histogram using ggplot2.

# 1. Install and load necessary libraries
# If you don't have ggplot2 installed, uncomment and run the line below:
# install.packages("ggplot2")
library(ggplot2)

# --- Section 1: Generate Sample Student Exam Scores ---
# In a real scenario, you would load your actual student scores here.

message("Generating sample student exam scores...")
set.seed(456) # Set seed for reproducibility

# Generate 100 random exam scores between 50 and 100
# Normally distributed scores, with a slight skew towards higher grades
num_students <- 100
mean_score <- 75
sd_score <- 15
# Generate scores, then clip to 50-100 range
student_scores <- round(rnorm(num_students, mean = mean_score, sd = sd_score), 0)
student_scores[student_scores < 50] <- 50  # Minimum score
student_scores[student_scores > 100] <- 100 # Maximum score

# Create a data frame (optional, but good practice for ggplot2)
scores_df <- data.frame(Score = student_scores)
message(sprintf("Generated %d sample scores.", num_students))

# --- Section 2: Calculate Basic Statistics ---

message("\nCalculating basic statistics...")

# Calculate Average Score
average_score <- mean(scores_df$Score)
message(sprintf("Average Score: %.2f", average_score))

# Calculate Variance of Scores
# Note: var() calculates sample variance (n-1 denominator) by default
variance_score <- var(scores_df$Score)
message(sprintf("Variance of Scores: %.2f", variance_score))

# Calculate Standard Deviation (square root of variance)
sd_score_calc <- sd(scores_df$Score)
message(sprintf("Standard Deviation: %.2f", sd_score_calc))

# --- Section 3: Perform a One-Sample T-test ---
# Let's test if the average score is significantly different from a hypothetical mean, say 70.

message("\nPerforming One-Sample t-test (mu = 70)...")
hypothesized_mean <- 70
t_test_result <- t.test(scores_df$Score, mu = hypothesized_mean)

message(sprintf("  Test statistic (t): %.2f", t_test_result$statistic))
message(sprintf("  Degrees of Freedom: %d", t_test_result$parameter))
message(sprintf("  P-value: %.4f", t_test_result$p.value))
message(sprintf("  95%% Confidence Interval: (%.2f, %.2f)", t_test_result$conf.int[1], t_test_result$conf.int[2]))
message(sprintf("  Sample Mean: %.2f", t_test_result$estimate))

# Interpret the p-value
if (t_test_result$p.value < 0.05) {
  message(sprintf("  Conclusion: The average score (%.2f) is statistically significantly different from %.2f (p < 0.05).", average_score, hypothesized_mean))
} else {
  message(sprintf("  Conclusion: There is no statistically significant difference between the average score (%.2f) and %.2f (p >= 0.05).", average_score, hypothesized_mean))
}


# --- Section 4: Display Score Distribution Chart (Histogram) ---

# Ensure a 'plots' directory exists
if (!dir.exists("plots")) {
  dir.create("plots")
}
message("\nGenerating score distribution histogram...")

p_score_hist <- ggplot(scores_df, aes(x = Score)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Student Exam Scores",
       x = "Score",
       y = "Number of Students") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  scale_x_continuous(breaks = seq(50, 100, by = 10), limits = c(50, 100)) # Set x-axis range and breaks

ggsave("plots/score_distribution_histogram.png", p_score_hist, width = 8, height = 6, dpi = 300)
message("Score distribution histogram saved to plots/score_distribution_histogram.png")

message("\nAnalysis complete!")