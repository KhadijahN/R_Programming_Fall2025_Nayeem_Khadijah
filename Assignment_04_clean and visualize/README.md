 In this post, I demonstrate how to clean and visualize patient data, handle missing values, and interpret relationships between blood pressure and physician assessments using R.


1. Data Preparation and Cleaning
First, we define the vectors and create a dataframe. Categorical variables are coded numerically: bad=1, good=0; low=0, high=1. Missing values are handled using na.omit().

# Define vectors
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)    # bad=1, good=0
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1

# Create dataframe
df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision, stringsAsFactors = FALSE
)

# Inspect for missing values
summary(df_hosp)

# Remove rows with NA
df_hosp <- na.omit(df_hosp)

2. Side-by-Side Boxplots
We compare blood pressure across physician assessments and final decisions.

# First Assessment
boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good", "Bad"),
  ylab = "Blood Pressure",
  main = "BP by First MD Assessment",
  col = c("lightblue", "salmon")
)

# Second Assessment
boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  main = "BP by Second MD Assessment",
  col = c("lightgreen", "orange")
)

# Final Decision
boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  main = "BP by Final Decision",
  col = c("lightgrey", "violet")
)





3. Histograms of Frequency and Blood Pressure
Histograms show the overall distribution of visit frequency and blood pressure.

# Histogram of Visit Frequency
hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),
  col = "lightblue",
  border = "white",
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency"
)

# Histogram of Blood Pressure
hist(
  df_hosp$BloodPressure,
  breaks = 8,
  col = "salmon",
  border = "white",
  xlab = "Blood Pressure",
  main = "Histogram of Blood Pressure"
)




4. Interpretation and Discussion
The boxplots show that blood pressure tends to be higher when physician assessments are labeled “Bad” or “High,” and similarly for “High” final decisions. This suggests that physicians’ evaluations align with actual vitals in this small dataset.

Histograms reveal a fairly even distribution of visit frequency but highlight extreme blood pressure values, such as 205, which could influence averages or comparisons. These outliers should be considered when interpreting patient data.'


Pictures or plots are located in my blog: https://rprogrammingkhadijah.blogspot.com/2025/09/assignment04clean-and-visualize.html

Handling the NA in FirstAssess by removing it ensured that visualizations were accurate. In real clinical datasets, more sophisticated imputation might be required to avoid bias. Overall, these visualizations provide insights into relationships between patient vitals and assessments, although the small sample size limits generalizability.
