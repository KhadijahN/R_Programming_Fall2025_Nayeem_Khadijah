 For this week’s assignment, I worked on testing and correcting a simple custom mean function in R.

I first created the vector:

assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

The original function was written as:

myMean <- function(assignment2) {

  return(sum(assignment) / length(someData))

}

When I ran:

myMean(assignment2)


I received this message:

Error in sum(assignment) : object 'assignment' not found

To fix this I did:

myMean <- function(x) { return(sum(x) / length(x)) }


Now when I ran:

myMean(assignment2)

The output is: 

[1] 19.25



FINAL CODE:
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

myMean <- function(x) {
  return(sum(x) / length(x))
}

myMean(assignment2) # expected output: 19.25
