# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

# Problem: Take a number, and return the next "featured" number that is greater than the argument. 
# => issue an error if there is no next featured num





# p featured?(21)

# Input: an integer
# Output: an integer, the next greater 'featured' number

# Algorithm:
# => write a method to determine if it is a 'featured' number
# A featured number is:
#   => odd
#   => a multiple of 7 (num % 7 == 0)
#   => digits occur exactly once earch

# => 

# Code: 

# => first, check if num is greater than 1_023_456_987, if so, return an error
# => make a counter that starts at num, and increments +1 until featured? == true
# return that number


def featured?(num)
  num.odd? && num % 7 == 0 && num.digits.uniq.size == num.digits.size
end

def next_featured(num)
  current_num = num + 1
  if num >= 9_876_543_201
    puts "ERROR: No featured number is greater than supplied number."
    return
  else
    until featured?(current_num) == true
      current_num += 1
    end 
  end
  current_num
end

p featured?(9_876_543_210)

# def next_featured(number)
#   number += 1
#   number += 1 until number.odd? && number % 7 == 0

#   loop do
#     number_chars = number.to_s.split('')
#     return number if number_chars.uniq == number_chars
#     number += 14
#     break if number >= 9_876_543_210
#   end

#   'There is no possible number that fulfills those requirements.'
# end

# Examples:

p next_featured(12) == 21
p next_featured(20) == 21
p next_featured(21) == 35
p next_featured(997) == 1029
p next_featured(1029) == 1043
p next_featured(999_999) == 1_023_547
p next_featured(999_999_987) == 1_023_456_987
p next_featured(9_999_999_999) # -> There is no possible number that fulfills those requirements