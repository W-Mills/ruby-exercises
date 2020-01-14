# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Problem: Write a method that computes the *difference* between:
# =>  the square of the sum of the first n positive integers
# =>   - if n = 3: (1 + 2 + 3)**2
# => and the sum of the squares of the first n positive integers
# =>   - if n = 3: (1**2 + 2**2 + 3**2)

# Input: an integer
# Output: an integer, the difference between 

# Algorithm:
# => determine the sum of the first n positive integers
# => populate an array with all of the positive integers from 1..n
#  => [*1..n]
# =>  - sum that array => using array.sum
# =>   - square that sum, and save the return value
#  
# => iterate over the range using map to transform, applying the square to each element
# => take that returned squares array and sum it => using array.sum
# =>  - square that sum, and save the return value 

# => return the difference between sum_range and sum_squares

def sum_square_difference(n)
  range = [*1..n]
  square_of_sums = range.sum ** 2
  sum_of_squares = range.sum { |num| num ** 2 }
  square_of_sums - sum_of_squares
end


# LS Solution:

# def sum_square_difference(n)
#   sum = 0
#   sum_of_squares = 0

#   1.upto(n) do |value|
#     sum += value
#     sum_of_squares += value**2
#   end

#   sum**2 - sum_of_squares
# end

# Examples:
# p sum_square_difference(10000000)
p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150