
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



set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
corrected_tukey(test_mat)
