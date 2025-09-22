1. Creating Matrices

# Create matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Inspect dimensions
dim(A)  # 10 x 10 (square)
dim(B)  # 10 x 100 (not square)
Output:

> dim(A)
[1] 10 10
> dim(B)
[1]  10 100

2. Determinant and Inverse
# For A (square matrix)
detA <- det(A)
invA <- tryCatch(solve(A), error = function(e) e)

# For B (non-square, should fail)
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)

# Print results
cat("Determinant of A:", detA, "\n")
print(invA)

print(detB)
print(invB)
Output:

Determinant of A: 0 

<simpleError in solve.default(A): 
  Lapack routine dgesv: system is exactly singular: U[6,6] = 0>

<simpleError in determinant.matrix(x, logarithm = TRUE): 'x' must be a square matrix'>

<simpleError in solve.default(B): 'a' is 10 x 100, should be square>


3. Explanation
Matrix A (10 × 10):

det(A) runs successfully and returns 0.

Since the determinant is 0, the matrix is singular, so it has no inverse.

That’s why solve(A) fails with a Lapack error.

Matrix B (10 × 100):

Not square → determinant and inverse are not defined.

Both operations fail immediately.

Numeric stability / performance notes:

In practice, even when a determinant is nonzero, large values can indicate near-singularity (unstable results).

Computing the inverse explicitly is rarely recommended — usually, we solve systems of equations with solve(A, b) directly for better stability and performance.
