# app.R

# This R script calculates Body Mass Index (BMI) based on user input
# for height and weight, and classifies the result according to WHO standards.

# Function to get numerical input from the user
# input_prompt: The message displayed to the user
# unit: The unit expected for the input (e.g., "meters", "kg")
# min_val, max_val: Optional min/max values for validation
get_numeric_input <- function(input_prompt, unit = "", min_val = -Inf, max_val = Inf) {
  repeat {
    cat(input_prompt) # Use cat for prompt without newline
    #user_input <- readline() # Read line from console

    user_input <- as.numeric(readLines(con = "stdin", n = 1))

    # Attempt to convert input to a number
    num_value <- suppressWarnings(as.numeric(user_input))

    # Validate if it's a number and within range
    if (!is.na(num_value) && num_value >= min_val && num_value <= max_val) {
      return(num_value)
    } else {
      if (unit != "") {
        cat(sprintf("Invalid input. Please enter a valid number for %s (e.g., 1.75 %s).", unit, unit), "\n")
      } else {
        cat("Invalid input. Please enter a valid number.", "\n")
      }
      if (min_val != -Inf || max_val != Inf) {
        cat(sprintf("Value must be between %.2f and %.2f.\n", min_val, max_val))
      }
    }
  }
}

# Function to calculate BMI
# height_m: Height in meters
# weight_kg: Weight in kilograms
calculate_bmi <- function(height_m, weight_kg) {
  if (height_m <= 0 || weight_kg <= 0) {
    stop("Height and weight must be positive values.")
  }
  # BMI Formula: weight (kg) / (height (m))^2
  bmi <- weight_kg / (height_m^2)
  return(bmi)
}

# Function to classify BMI based on WHO standards
# bmi_value: The calculated BMI
classify_bmi <- function(bmi_value) {
  if (bmi_value < 18.5) {
    return("Underweight")
  } else if (bmi_value >= 18.5 && bmi_value < 24.9) {
    return("Normal weight")
  } else if (bmi_value >= 25.0 && bmi_value < 29.9) {
    return("Overweight")
  } else if (bmi_value >= 30.0 && bmi_value < 34.9) {
    return("Obesity Class I")
  } else if (bmi_value >= 35.0 && bmi_value < 39.9) {
    return("Obesity Class II")
  } else {
    return("Obesity Class III (Morbid Obesity)")
  }
}

# Main application logic
run_bmi_calculator <- function() {
  cat("--- Welcome to the BMI Calculator! ---", "\n")

  # Get height in meters from the user
  # Assuming realistic human height range: 0.5m to 2.5m
  height_m <- get_numeric_input("Enter your height in meters (e.g., 1.75): ", "meters", 0.5, 2.5)

  # Get weight in kilograms from the user
  # Assuming realistic human weight range: 10kg to 300kg
  weight_kg <- get_numeric_input("Enter your weight in kilograms (e.g., 70): ", "kg", 10, 300)

  # Calculate BMI
  bmi_result <- tryCatch({
    calculate_bmi(height_m, weight_kg)
  }, error = function(e) {
    message(e$message) # Print the error message
    return(NA) # Return NA to indicate calculation failure
  })

  # Display results if BMI was calculated successfully
  if (!is.na(bmi_result)) {
    bmi_category <- classify_bmi(bmi_result)

    cat("\n--- Your BMI Result ---", "\n")
    cat(sprintf("Height: %.2f meters\n", height_m))
    cat(sprintf("Weight: %.2f kg\n", weight_kg))
    cat(sprintf("Your BMI: %.2f\n", bmi_result))
    cat(sprintf("Category: %s\n", bmi_category))
    cat("-----------------------", "\n")

    # Provide a simple health note
    if (bmi_category == "Underweight") {
      cat("Note: It's advisable to consult a healthcare professional for personalized advice.\n")
    } else if (bmi_category == "Normal weight") {
      cat("Note: Your BMI is in the healthy range. Keep up the good work!\n")
    } else if (bmi_category == "Overweight" || startsWith(bmi_category, "Obesity")) {
      cat("Note: It's advisable to consult a healthcare professional for personalized advice on weight management.\n")
    }
  } else {
    cat("\nCould not calculate BMI due to invalid input.\n")
  }

  cat("\nThank you for using the BMI Calculator!", "\n")
}

# Run the BMI calculator application
run_bmi_calculator()