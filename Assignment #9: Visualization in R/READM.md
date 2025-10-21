
Objectives
The goal of this post is to compare three major visualization systems in R: Base R graphics, Lattice, and ggplot2.

I’ll use the same dataset in all three systems to explore relationships between variables, and then discuss the differences in syntax, workflow, and output quality.

Objectives:

Compare Base, Lattice, and ggplot2 plotting systems

Apply each system to the same dataset (mtcars)

Observe differences in syntax, style, and output

Develop reproducible R code

Reflect on the visualization experience




 Dataset: mtcars

The mtcars dataset (from the R datasets package) contains fuel consumption and performance data for 32 cars.

# Load dataset
data("mtcars")
head(mtcars)
Key Variables Used:

mpg: Miles per gallon (fuel efficiency)

hp: Horsepower (engine power)

cyl: Number of cylinders




Part 1: Base R Graphics

Base R graphics are the original plotting system in R. They’re procedural — each plot is built step-by-step using functions like plot(), lines(), and text().





Example 1: Scatter Plot (MPG vs Horsepower)

plot(mtcars$hp, mtcars$mpg,
     main = "Base R: MPG vs Horsepower",
     xlab = "Horsepower (hp)",
     ylab = "Miles per Gallon (mpg)",
     pch = 19, col = "steelblue")

abline(lm(mpg ~ hp, data = mtcars), col = "red", lwd = 2)
Figure 1: Base R scatter plot of MPG vs. HP









Example 2: Histogram of MPG

hist(mtcars$mpg,
     main = "Base R: Distribution of MPG",
     xlab = "Miles per Gallon (MPG)",
     col = "lightgreen",
     border = "white")
Figure 2: Base R histogram of MPG







Observations

Base graphics are quick for exploratory plots, but:

Customization (colors, themes, legends) must be added manually.

Code can become cluttered with multiple layers.

No built-in support for faceting or conditioning.





 Part 2: Lattice Graphics
The Lattice package builds on the idea of trellis graphics — easy conditioning (small multiples) and cleaner syntax for multivariate plots.

library(lattice)





Example 1: MPG vs HP by Cylinders
xyplot(mpg ~ hp | factor(cyl),
       data = mtcars,
       main = "Lattice: MPG vs HP by Cylinders",
       xlab = "Horsepower",
       ylab = "Miles per Gallon",
       layout = c(3, 1),
       pch = 19, col = "darkorange")
Figure 3: Lattice scatter plot by cylinders





Example 2: Boxplot of MPG by Cylinders

bwplot(mpg ~ factor(cyl),
       data = mtcars,
       main = "Lattice: MPG by Cylinder Count",
       xlab = "Cylinders",
       ylab = "Miles per Gallon",
       fill = "lightblue")
Figure 4: Lattice boxplot of MPG by cylinders








 Observations

Lattice simplifies multivariate plots:

Excellent for conditioned (faceted) displays.

Syntax uses formulas (y ~ x | group) for clarity.

Customization is possible but less intuitive.

Harder to layer or annotate individual elements.







Part 3: ggplot2 Graphics

ggplot2, part of the tidyverse, implements the “Grammar of Graphics.”
Plots are built up in layers: data → aesthetics → geometries → themes.

library(ggplot2)




Example 1: Scatter Plot with Regression Line
ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: MPG vs HP by Cylinders",
       x = "Horsepower",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal()
Figure 5: ggplot2 scatter plot of MPG vs HP by cylinders







Example 2: Faceted Histogram of MPG

ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(binwidth = 2, color = "white") +
  facet_wrap(~ cyl) +
  labs(title = "ggplot2: MPG Distribution by Cylinders",
       x = "MPG",
       y = "Count",
       fill = "Cylinders") +
  theme_light()
Figure 6: ggplot2 faceted histogram





Observations

ggplot2 offers the most control and best aesthetic quality.

Layered syntax feels declarative and modular.

Faceting and theming are simple and elegant.

Suitable for reproducible and publication-quality graphics    




Comparison Table
Feature	Base R	Lattice	ggplot2
Syntax	Procedural	Formula-based	Layered grammar
Ease of use	Easy for simple plots	Great for conditioning	Slight learning curve
Customization	Manual	Moderate	Extensive
Faceting	Manual	Built-in	Built-in
Aesthetic quality	Basic	Decent	Excellent
Best use case	Quick exploration	Multivariate plots	Publications & reproducibility



Reflections
This comparison highlighted how R’s visualization systems evolved:

Base R is functional and fast for ad-hoc exploration.

Lattice was a big step toward structured, consistent graphics.

ggplot2 now dominates because of its flexibility, design consistency, and integration with the tidyverse.

While switching systems, I found:

Base R required more code to achieve a polished look.

Lattice felt concise but harder to tweak.

ggplot2 required learning its structure, but once I did, it produced the best results with the least frustration.

Overall, ggplot2 offered the best balance between control, readability, and output quality.





Conclusion

Each system serves its purpose:

Use Base R for quick, simple visuals.

Use Lattice for multivariate, conditioned displays.

Use ggplot2 for professional, shareable, and reproducible graphics.

For most modern R workflows, ggplot2 is the go-to choice for clarity, style, and versatility.
