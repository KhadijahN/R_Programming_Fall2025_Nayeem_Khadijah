For this week’s assignment, I worked on testing and correcting a simple custom mean function in R. At first glance, the task seemed straightforward: write a function to calculate the mean of a vector. However, I quickly realized that even small mistakes in variable names could cause the code to fail.

I started by creating the vector:

assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)
The original function was written as:

myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}
When I ran myMean(assignment2), I received the following error:

Error in sum(assignment) : object 'assignment' not found
At first, this was confusing. I realized the function was trying to sum a variable assignment that didn’t exist and was also referencing someData instead of the input vector. This was a good reminder that R is very literal about variable names and scope.

To fix the function, I rewrote it as:

myMean <- function(x) {
  return(sum(x) / length(x))
}
I tested it by running myMean(assignment2) and received the correct output:

[1] 19.25
The testing process was simple but important. I ran the function with different vectors to make sure it returned the correct mean each time. Through this assignment, I learned that even small mistakes in variable naming can completely break a function, and testing with multiple inputs is key to making sure the code works as intended.


Overall, the assignment was a good reminder that programming is as much about careful attention to detail as it is about logic. The correction was straightforward, but understanding why the original code failed required a careful step-by-step review.
