 In this assignment, I practiced basic matrix arithmetic, learned how to build diagonal matrices with diag(), and constructed a custom block-structured matrix. Below are my R code, results, and short explanations for each task.


Task 1: Matrix Addition & Subtraction
# Define matrices A and B
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Matrix addition
A_plus_B <- A + B
print("A + B =")
print(A_plus_B)

# Matrix subtraction
A_minus_B <- A - B
print("A - B =")
print(A_minus_B)
Output:

A + B =
     [,1] [,2]
[1,]    7    5
[2,]    2    2
[3,]    5    0
[4,]    2    2

A - B =
     [,1] [,2]
[1,]   -3   -3
[2,]   -2    4
[3,]   -3    2
[4,]    4    4
Explanation:
Matrix addition and subtraction are performed element by element. Each entry in A is added to or subtracted from the corresponding entry in B.


Task 2: Create a Diagonal Matrix
# Create a diagonal matrix with given entries
D <- diag(c(4, 1, 2, 3))
print("Diagonal Matrix D =")
print(D)
Output:

Diagonal Matrix D =
     [,1] [,2] [,3] [,4]
[1,]    4    0    0    0
[2,]    0    1    0    0
[3,]    0    0    2    0
[4,]    0    0    0    3
Explanation:
The diag() function creates a square matrix where the given values appear along the diagonal and all other entries are zero.


Task 3: Construct a Custom 5×5 Matrix
# Create the custom block-structured 5x5 matrix
custom_matrix <- cbind(
  c(3, 2, 2, 2, 2),                # First column
  rbind(1, diag(c(3, 3, 3, 3)))    # Remaining columns
)

print("Custom 5x5 Matrix =")
print(custom_matrix)
Output:

Custom 5x5 Matrix =
     [,1] [,2] [,3] [,4] [,5]
[1,]    3    1    1    1    1
[2,]    2    3    0    0    0
[3,]    2    0    3    0    0
[4,]    2    0    0    3    0
[5,]    2    0    0    0    3
Explanation:
This matrix was created by combining a custom first column with a block diagonal structure made using diag(), then joining them with cbind() and rbind().

