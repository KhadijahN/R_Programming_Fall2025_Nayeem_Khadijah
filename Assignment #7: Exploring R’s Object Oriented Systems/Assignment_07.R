# Load dataset
data("mtcars")

# Show first few rows
head(mtcars)

# Describe structure
str(mtcars)
# Using print (generic function)
print(mtcars)

# Using summary (generic function)
summary(mtcars)

# Using plot (generic function)
plot(mtcars$mpg, mtcars$hp, main="MPG vs Horsepower", xlab="MPG", ylab="Horsepower")




# Create S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Define a simple print method for our S3 object
print.student_s3 <- function(obj) {
  cat("Name:", obj$name, "\nAge:", obj$age, "\nGPA:", obj$GPA, "\n")
}

# Test S3 print
print(s3_obj)

# Create S4 class
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))

# Instantiate S4 object
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

# Define a print method for S4
setMethod("show", "student_s4", function(object) {
  cat("Name:", object@name, "\nAge:", object@age, "\nGPA:", object@GPA, "\n")
})

# Test S4 print
s4_obj
