For this assignment, I practiced creating and inspecting data structures in R, calculating summary statistics, and visualizing categorical data. Using a small set of made-up polling numbers, I explored how different candidates performed across two sources (ABC and CBS), compared the results, and reflected on what this kind of data can and cannot tell us. While the dataset is artificial, the exercise was useful for building skills in data wrangling, plotting, and interpretation.

Looking at the poll data, Donald has the highest support across both ABC and CBS polls, with CBS showing him slightly stronger than ABC. Ted appears to perform better in ABC than in CBS, while Hillary and Bernie both gain ground in CBS compared to ABC. The Diff column clearly shows these discrepancies, where some candidates (like Hillary and Bernie) show positive differences while others (like Ted) show negative ones. Overall, Donald dominates consistently, while lower-tier candidates like Jeb and Carly remain near the bottom regardless of polling source.

Key Patterns
Looking at the poll data, Donald has the highest support across both ABC and CBS polls, with CBS showing him slightly stronger than ABC. Ted appears to perform better in ABC than in CBS, while Hillary and Bernie both gain ground in CBS compared to ABC. The Diff column clearly shows these discrepancies, where some candidates (like Hillary and Bernie) show positive differences while others (like Ted) show negative ones. Overall, Donald dominates consistently, while lower-tier candidates like Jeb and Carly remain near the bottom regardless of polling source.

Impact of Using Made-Up Data
Since this dataset was fabricated, the results cannot be trusted as a reflection of real voter preferences. The numbers were arbitrarily chosen without any connection to survey methodology, random sampling, or statistical rigor. Using artificial data introduces bias, obscures actual variability in public opinion, and could mislead if interpreted as genuine. Any patterns we see here are purely illustrative and should be understood as practice in using R rather than evidence of political trends.

Collecting or Validating Real Poll Data
In a true analysis, reliable poll data should come from established survey organizations that disclose their sampling methods, question wording, and response rates. Collecting data would involve randomized sampling of likely voters and careful weighting for demographics. To validate, one could cross-check results with multiple independent polling organizations and use poll aggregators like FiveThirtyEight or Pew Research Center. These practices ensure that conclusions are based on real, representative, and reproducible data rather than arbitrary numbers.


MY R CODE
# Define the data
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine into data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect the data
str(df_polls)
head(df_polls)

# Compute summary statistics
mean(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("ABC_poll", "CBS_poll")])

# Add a column for CBS - ABC difference
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# Load library
library(ggplot2)

# Visualization: Bar chart comparison
ggplot(df_polls, aes(x = Name)) +
  geom_bar(aes(y = ABC_poll, fill = "ABC"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = CBS_poll, fill = "CBS"), stat = "identity", position = "dodge") +
  labs(title = "Polling Comparison: ABC vs CBS", y = "Poll Percentage", fill = "Poll Source") +
  theme_minimal()
The bar is located in my blog: https://rprogrammingkhadijah.blogspot.com/2025/09/poll-analysis-with-r.html

