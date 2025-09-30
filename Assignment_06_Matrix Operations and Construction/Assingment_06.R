#1
# Define matrices A and B
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Matrix addition + subtraction
A_plus_B <- A + B
print("A + B =")
print(A_plus_B)

A_minus_B <- A - B
print("A - B =")
print(A_minus_B)

#2
D <- diag(c(4, 1, 2, 3))
print("Diagonal Matrix D =")
print(D)

#3
custom_matrix <- cbind(
  c(3, 2, 2, 2, 2),                # First column
  rbind(1, diag(c(3, 3, 3, 3)))    # Remaining columns
)

print("Custom 5x5 Matrix =")
print(custom_matrix)

