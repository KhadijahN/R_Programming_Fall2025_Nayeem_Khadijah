This assignment focused on debugging and defensive programming in R. The goal was to identify and fix a bug in a provided function that detects outlier rows in a numeric matrix using the Tukey rule, while documenting the full debugging workflow.

Reproduce the Error
The provided buggy code was:

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}
When I ran:

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)
R returned this error:

Error in outliers[, j] && tukey.outlier(x[, j]) : 
  'length = 10' in coercion to 'logical(1)'
Diagnose the Bug
The operator && only compares the first element of each logical vector and returns a single TRUE/FALSE value.
Since we needed to perform the comparison element-wise across all elements of the matrix columns, we had to use the & operator instead.

So the corrected operation is:

outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
Fix the Code
I also added a helper function to compute Tukey outliers and included basic input checks for defensive programming.

tukey.outlier <- function(y) {
  q1 <- quantile(y, 0.25, na.rm = TRUE)
  q3 <- quantile(y, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower_bound <- q1 - 1.5 * iqr
  upper_bound <- q3 + 1.5 * iqr
  y < lower_bound | y > upper_bound
}

corrected_tukey <- function(x) {
  if (!is.matrix(x)) stop("Input must be a matrix.")
  if (!is.numeric(x)) stop("Matrix must be numeric.")
  if (nrow(x) == 0 || ncol(x) == 0) stop("Matrix cannot be empty.")

  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }

  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }

  outlier.vec
}
Validate Your Fix
Testing on the same dataset:

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
corrected_tukey(test_mat)
Output:

[1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
Adding an outlier confirms that it’s working correctly:

test_mat[1, ] <- 10
corrected_tukey(test_mat)
# [1] TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
Defensive Enhancements
Added safety checks:

Input must be a matrix

Matrix must contain numeric data

Matrix cannot be empty

If these are violated, the function stops and prints a clear error message.

Through this exercise, I learned to:

Reproduce and interpret R error messages

Distinguish between element-wise (&) and scalar (&&) logical operators

Apply defensive programming techniques

Verify correctness by testing with both normal and extreme data

This process reinforced how small syntax details in R can lead to major logical issues, and how systematic debugging helps catch them efficiently.



