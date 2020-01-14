# Series
# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

# Problem: write a program that takes a string of digits and an argument (n) and return all the possible consecutive number series of length n in that string.

# Explore: 
# If n > string.length ? # => raise ArgumentError
# 

class Series
  attr_reader :input

  def initialize(string)
    @input = string
  end

  def slices(n)
    raise ArgumentError if n > @input.size
    digits_arr = input.split("").map(&:to_i)
    slices_arr = []
    digits_arr.each_cons(n) { |arr| slices_arr << arr }
    slices_arr
  end
end