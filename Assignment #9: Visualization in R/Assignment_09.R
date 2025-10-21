# Load dataset
data("mtcars")
head(mtcars)
# Scatter plot: mpg vs. hp
plot(mtcars$hp, mtcars$mpg,
     main = "Base R: MPG vs Horsepower",
     xlab = "Horsepower (hp)",
     ylab = "Miles per Gallon (mpg)",
     pch = 19, col = "steelblue")

# Add a regression line
abline(lm(mpg ~ hp, data = mtcars), col = "red", lwd = 2)

# Histogram of mpg
hist(mtcars$mpg,
     main = "Base R: Distribution of MPG",
     xlab = "MPG",
     col = "lightgreen",
     border = "white")
library(lattice)

# Scatter plot conditioned by number of cylinders
xyplot(mpg ~ hp | factor(cyl),
       data = mtcars,
       main = "Lattice: MPG vs HP by Cylinders",
       xlab = "Horsepower",
       ylab = "Miles per Gallon",
       layout = c(3, 1),
       pch = 19, col = "darkorange")

# Boxplot of MPG by cylinders
bwplot(mpg ~ factor(cyl),
       data = mtcars,
       main = "Lattice: MPG by Cylinder Count",
       xlab = "Cylinders",
       ylab = "MPG",
       fill = "lightblue")
library(ggplot2)

# Scatter plot with regression line and color by cylinders
ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: MPG vs HP by Cylinders",
       x = "Horsepower",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal()

# Faceted histogram
ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(binwidth = 2, color = "white") +
  facet_wrap(~ cyl) +
  labs(title = "ggplot2: MPG Distribution by Cylinders",
       x = "MPG",
       y = "Count",
       fill = "Cylinders") +
  theme_light()
