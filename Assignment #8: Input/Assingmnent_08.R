
Objectives
Read and write data files in R

Group and summarize data using plyr

Filter character data with regular expressions

Export results to text and CSV formats                                                                                                 Step 1: Import Data and Compute Mean Victim Age by Sex

# Choose your CSV file interactively
crime <- read.csv(file.choose(), stringsAsFactors = FALSE)

# Load the plyr library
library(plyr)

# Compute mean victim age by sex
gender_mean <- ddply(
  crime,
  "Vict.Sex",
  summarise,
  Avg_Victim_Age = mean(Vict.Age, na.rm = TRUE)
)

# Write grouped means to a tab-delimited text file
write.table(
  gender_mean,
  file = "victim_age_mean.txt",
  sep = "\t",
  row.names = FALSE
)
What this does:
This step loads your dataset (Crime_Data_from_2020_to_Present.csv), calculates the average victim age for each Victim Sex group, and exports the summary table as victim_age_mean.txt.

Example console output (conceptual):

> head(gender_mean)
  Vict.Sex Avg_Victim_Age
1       F           35.4
2       M           33.8
3       X           40.1

Step 2: Filter Crimes Containing “i” in the Description
# Filter rows where the crime description contains "i" (case-insensitive)
i_crimes <- subset(
  crime,
  grepl("i", Crm.Cd.Desc, ignore.case = TRUE)
)

# Write only the descriptions to a CSV
write.csv(
  i_crimes$Crm.Cd.Desc,
  file = "i_crimes.csv",
  row.names = FALSE,
  quote = FALSE
)
What this does:
This step filters all crimes whose Crime Code Description contains the letter “i” (for example, "Burglary", "Vandalism", "Homicide").
It saves just those descriptions into a CSV file named i_crimes.csv.

Example console output (conceptual):

> head(i_crimes$Crm.Cd.Desc)
[1] "BURGLARY" "HOMICIDE" "VANDALISM"
Step 3: Export Full Filtered Dataset
# Save the full filtered dataset (all columns)
write.csv(
  i_crimes,
  file = "i_crimes_full.csv",
  row.names = FALSE
)
What this does:
This exports the entire filtered dataset — all columns for crimes that have an “i” in the description — to i_crimes_full.csv.

Confirming Output Files

list.files()


victim_age_mean.txt

i_crimes.csv
i_crimes_full.csv

Imported a real-world dataset (Crime_Data_from_2020_to_Present.csv).

Used plyr to compute summary statistics (average victim age by sex).

Used grepl() to filter text data.

Exported results to multiple file formats (TXT and CSV).
