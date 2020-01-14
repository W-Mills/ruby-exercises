# Rotation (Part 1)
# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(array)
  copy = array.clone
  first = copy.shift
  copy.push(first)
end

# Example:

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Further Exploration
# Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.

def rotate_string(string)
  string[1..-1] + string[0]
end

p rotate_string("baddie")
p rotate_string("blur")
p rotate_string("cowabunga")



def rotate_integer(integer)
  digits = integer.digits
  (digits[0..-2].reverse) + [digits[-1]].flatten
end

p rotate_integer(12345)
p rotate_integer(222225)
p rotate_integer(0)