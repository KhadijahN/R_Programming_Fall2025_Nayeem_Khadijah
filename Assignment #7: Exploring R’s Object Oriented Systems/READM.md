
1. Choose or Download Data
We’ll use the built-in mtcars dataset for simplicity.

INPUT

# Load dataset
data("mtcars")

# Show first few rows
head(mtcars)

# Describe structure
str(mtcars)
 
OUTPUT
data.frame':	32 obs. of  11 variables:
 $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
 $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
 $ disp: num  160 160 108 258 360 ...
 $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
 $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
 $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
 $ qsec: num  16.5 17 18.6 19.4 17 ...
 $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
 $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
 $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
 $ carb: num  4 4 1 1 2 1 4 2 2 4 ...        
Explanation:

head() shows the first 6 rows of a dataset.

str() displays the structure: type of object (data.frame), column names, and data types.

2. Test Generic Functions
We can test generic functions like print(), summary(), and plot().

INPUT

# Using print (generic function)
print(mtcars)

# Using summary (generic function)
summary(mtcars)

# Using plot (generic function)
plot(mtcars$mpg, mtcars$hp, main="MPG vs Horsepower", xlab="MPG", ylab="Horsepower")

OUTPUT 



     mpg             cyl             disp             hp             drat             wt       
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0   Min.   :2.760   Min.   :1.513  
 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5   1st Qu.:3.080   1st Qu.:2.581  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0   Median :3.695   Median :3.325  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7   Mean   :3.597   Mean   :3.217  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0   3rd Qu.:3.920   3rd Qu.:3.610  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0   Max.   :4.930   Max.   :5.424  
      qsec             vs               am              gear            carb      
 Min.   :14.50   Min.   :0.0000   Min.   :0.0000   Min.   :3.000   Min.   :1.000  
 1st Qu.:16.89   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
 Median :17.71   Median :0.0000   Median :0.0000   Median :4.000   Median :2.000  
 Mean   :17.85   Mean   :0.4375   Mean   :0.4062   Mean   :3.688   Mean   :2.812  
 3rd Qu.:18.90   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
 Max.   :22.90   Max.   :1.0000   Max.   :1.0000   Max.   :5.000   Max.   :8.000  
Notes:

summary() has methods for data frames, so it gives descriptive statistics.

plot() also has methods for numeric vectors, so it dispatches correctly.

If a generic has no method for an object (e.g., a custom object with no summary() method), R will throw an error.

3. Explore S3 vs. S4
S3 Example

INPUT
# Create S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Define a simple print method for our S3 object
print.student_s3 <- function(obj) {
  cat("Name:", obj$name, "\nAge:", obj$age, "\nGPA:", obj$GPA, "\n")
}

# Test S3 print
print(s3_obj)

output

Name: Myself 
Age: 29 
GPA: 3.5 
S3 objects are informal, just lists with a class attribute.

Generic dispatch happens when print() sees student_s3 and calls print.student_s3().

S4 Example

INPUT
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




OUTPUT

Name: Myself 
Age: 29 
GPA: 3.5 
S4 objects are formal: classes have predefined slots and types.

Method dispatch uses setMethod() instead of function naming.

4. Discussion Questions 
Q1. How can you tell whether an object uses S3 or S4?

Use isS3(object) and isS4(object).

S3 objects usually are lists with a class attribute.

S4 objects have formal slots and are created via new().

Q2. How do you determine an object’s underlying type?

Use typeof(object) to see the basic type (e.g., "list", "integer").

Use class(object) to see its object-oriented class.

Q3. What is a generic function in R?

A function that can operate differently depending on the class of its input.

Examples: print(), summary(), plot().

Q4. Principal differences between S3 and S4

Feature	S3	S4
Class definition	Informal (just assign class to object)	Formal (setClass)
Slots	Usually a list, flexible	Predefined with types
Method definition	generic.class function	setMethod()
Dispatch	Based on class attribute	Formal method dispatch based on class
