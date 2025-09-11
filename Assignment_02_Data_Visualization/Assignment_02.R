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
The bar chart in my blog shows each candidate’s support levels in the ABC and CBS polls, highlighting the differences across the two sources 
you can check out my blog through this link! enojoy!:
https://rprogrammingkhadijah.blogspot.com/2025/09/poll-analysis-with-r.html



