A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)
dim(A) 
dim(B) 
detA <- det(A)
invA <- tryCatch(solve(A), error = function(e) e)

invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)
cat("Determinant of A:", detA, "\n")
cat("Inverse of A:\n")
print(invA)

cat("\nDeterminant of B:\n")
print(detB)

cat("\nInverse of B:\n")
print(invB)
