require 'pry'
# Transpose 3x3
# A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6
# can be described by the Array of Arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

# To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.

# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6
# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

# Problem: write a method that takes a 3 x 3 matrix in array of arrays format and returns the transpose of the original matrix
# => do not modify the original matrix, return a new collection

# Input: an array with 3 sub-arrays each with 3 elements
# Output: a similar array as the input, but the sub-arrays will be populated by each of the same element number from the original sub-arrays
# => i.e. if we call the original sub-arrs with letters "a, b, c"
# => a[0], a[1], a[2]
# => b[0], b[1], b[2]
# => c[0], c[1], c[2]

# will return a new array containing (what was):
# [  [ a[0], b[0], c[0] ]
#    [ a[1], b[1], c[1] ]
#    [ a[2], b[2], c[2] ] ]

# the number of elements per sub-arr will always be the same as the matrix_size
# => so init an array with matrix.size elements in a range, reducing each by 1 with map
# =>  - use this to determine iteration counts
# => - init a new array to be returned

# => iterate matrix_size number of times over column indexes
# =>  - then using map, iterate over row indexes to populate new rows
# =>   - add each new row to the new_matrix array
# => -return the new array

def transpose(matrix)
  num_elements = [*1..matrix.size].map {|num| num - 1}
  new_matrix = []
  num_elements.each do |column_ind|
    new_row = num_elements.map { |row_ind| matrix[row_ind][column_ind] }
    new_matrix << new_row
    end
  new_matrix
end

p transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]


# The Logic of what's moving:

# matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
# matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
# matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]

# matrix[0][0] matrix[1][1] and matrix [2][2] don't move  

# def transpose!(matrix)
#   col, row = 0, 1
#   loop do
#     puts "row: #{row}, col: #{col}"
#     matrix[row][col], matrix [col][row] = matrix[col][row], matrix[row][col]
#     p matrix
#     row += 1 until matrix.size - 1
#     col += 1
#     break if row == matrix.size - 1 && col == matrix.size - 1
#   end

#   # loop do
#   #   puts "row: #{row}, col: #{col}"
#   #   matrix[row][col], matrix [col][row] = matrix[col][row], matrix[row][col]
#   #   p matrix
#   #   col += 1
#   #   break if col == matrix.size - 1 
#   # end
#   matrix
# end

# def transpose!(matrix)
#   col, row = 0, 1
#   loop do
#     matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
#     matrix[col][row], matrix [row][col] = matrix[col][row]
#     row += 1
#     matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
#     col += 1
#     matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]
#     break
#   end
#   matrix
# end



# Examples

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# p transpose!(matrix) == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]




# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# matrix_4 = [
#   [1, 5, 8, 9],
#   [4, 7, 2, 1],
#   [3, 9, 6, 3],
#   [7, 3, 1, 0]
# ]

# p matrix_4 = [
#   [1, 5, 8, 9],
#   [4, 7, 2, 1], # 2 and 9 didn't flip
#   [3, 9, 6, 3],
#   [7, 3, 1, 0]
# ]

# p transpose!(matrix_4) #== [[1, 4, 3, 7], [5, 7, 9, 3], [8, 2, 6, 1], [9, 1, 3, 0]]
# p "We want: #{[[1, 4, 3, 7], [5, 7, 9, 3], [8, 2, 6, 1], [9, 1, 3, 0]]}"

# new_matrix_4 = transpose(matrix_4)

# p matrix_4 == [[1, 5, 8, 9], [4, 7, 2, 1], [3, 9, 6, 3], [7, 3, 1, 0]]
# # This program should print "true" twice.


