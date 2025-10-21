
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
