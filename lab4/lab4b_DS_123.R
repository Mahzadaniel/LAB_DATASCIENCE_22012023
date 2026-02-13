# Task 1
age <- c(55,57,56,52,51,59,58,53,59,55,60,60,60,60,52,55,56,51,60,
         52,54,56,52,57,54,56,58,53,53,50,55,51,57,60,57,55,51,50,57,58)
age_factor <- factor(age) 
levels(age_factor) 
table(age_factor)
age_ranges <- cut(age, breaks = c(50, 52, 54, 56, 58, 60), include.lowest = TRUE, right = FALSE) 
table(age_ranges) 

#Task 2
V1 <- c(2,3,1,5,4,6,8,7,9) 

Matrix_1 <- matrix(V1, nrow = 3, ncol = 3) 
Matrix_2 <- t(Matrix_1)
colnames(Matrix_2) <- c("Col1", "Col2", "Col3")
rownames(Matrix_2) <- c("Row1", "Row2", "Row3") 
print("Result")
add_mat <- Matrix_1 + Matrix_2 
sub_mat <- Matrix_1 - Matrix_2 
mul_mat <- Matrix_1 * Matrix_2 
div_mat <- Matrix_1 / Matrix_2 
print (add_mat)
print(sub_mat)
print (mul_mat)
print (div_mat)

#Task3
vector1 <- 1:24
Array1 <- array(vector1, dim = c(2, 4, 3))

vector2 <- 25:54
Array2 <- array(vector2, dim = c(3, 2, 5))

print("The second row of the second matrix of the first array:")
print(Array1[2, , 2])

print("The element in the 3rd row and 2nd column of the 1st matrix:")
print(Array2[3, 2, 1])