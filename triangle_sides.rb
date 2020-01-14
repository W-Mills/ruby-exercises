# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Problem: 

# Compare the three sides entered as input, and catagorize the triangle-type into:
# => :equilateral
# =>  - all three sides are equal
# => :isosceles
# =>  - 2 sides are equal, while 3rd side is different
# => :scalene
# =>  - all three sides are different
# => :invalid
# =>  - if the sum of the lengths of two shortest sides < longest side
# =>  - any lengths < 1

# Input: 3 integers (3 lengths of a maybe triangle)
# Output: a symbol representing which kind of triangle the sides represent

# Data Structure: putting all three supplied numbers into an array, to allow for array sorting methods

# Algorithm:
# => side_1, side_2, side_3
# => use helper methods that check for triangle type
# =>  - and return a boolean value
# => use conditional if/else statement to check for validity of each triangle type
# => return appropriate symbol if true

def triangle(first, second, third)
  num_arr = [first, second, third]
  if invalid?(num_arr)
    return :invalid
  elsif equilateral?(num_arr)
    return :equilateral
  elsif isosceles?(num_arr)
    return :isosceles
  elsif scalene?(num_arr)
    return :scalene
  end
end

def invalid?(array)
  return true if array.select {|num| num <= 0}.size > 0
  true if ((array.sum) - array.max) < array.max
end

def equilateral?(array)
  array.uniq.size == 1
end

def isosceles?(array)
  array.uniq.size == 2
end

def scalene?(array)
  array.uniq.size == 3
end


# Examples:

p triangle(0, -3, 3) == :invalid
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid