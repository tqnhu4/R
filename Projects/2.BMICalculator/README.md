# R BMI Calculator CLI Application
A simple command-line interface (CLI) application written in R that calculates a user's Body Mass Index (BMI) and classifies it according to the World Health Organization (WHO) standards.


## Features
- User Input: Prompts the user to enter their height (in meters) and weight (in kilograms).

- BMI Calculation: Computes BMI using the standard formula: weight (kg)/(height (m)) 2.

- WHO Classification: Categorizes the calculated BMI into standard ranges:

  - Underweight

  - Normal weight

  - Overweight

  - Obesity Class I

  - Obesity Class II

  - Obesity Class III (Morbid Obesity)

- Input Validation: Ensures that numerical inputs are provided and fall within a reasonable range for human height and weight.

- Clear Output: Displays the entered height and weight, the calculated BMI, and its classification, along with a simple health note.

## Prerequisites
To run this application, you need to have R installed on your system.

 - Install R:

  - Download and install R from CRAN.

  - It's recommended to also install RStudio Desktop for a more user-friendly development environment.


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
After running the script, you will be prompted to enter your height and weight:

```text
--- Welcome to the BMI Calculator! ---
Enter your height in meters (e.g., 1.75): 1.75
Enter your weight in kilograms (e.g., 70): 70

--- Your BMI Result ---
Height: 1.75 meters
Weight: 70.00 kg
Your BMI: 22.86
Category: Normal weight
-----------------------
Note: Your BMI is in the healthy range. Keep up the good work!

Thank you for using the BMI Calculator!
```


## How It Works
- get_numeric_input(): This helper function safely prompts the user for a numerical value. It includes a loop that repeatedly asks for input until a valid number within specified (optional) min/max ranges is provided.

- calculate_bmi(): Takes height_m (height in meters) and weight_kg (weight in kilograms) as input. It calculates BMI using the formula BMI=weight/height 2. Basic validation for positive values is included.

- classify_bmi(): This function takes the calculated BMI value and returns a string classifying it into one of the WHO categories.

- run_bmi_calculator():

  - This is the main function that orchestrates the application.

  - It calls get_numeric_input() twice to collect height and weight from the user.

  - It then calls calculate_bmi() to get the BMI value, using tryCatch for robust error handling in case of invalid calculations (e.g., zero height/weight, though pre-checked by get_numeric_input).

  - Finally, it calls classify_bmi() and prints all the results in a formatted output, along with a simple health-related note based on the BMI category.


## WHO BMI Classification Standards
The classifications used in this calculator are based on the World Health Organization (WHO) standards for adults:

- Underweight: <18.5

- Normal weight: 18.5−24.9

- Overweight: 25.0−29.9

- Obesity Class I: 30.0−34.9

- Obesity Class II: 35.0−39.9

- Obesity Class III: ≥40.0

