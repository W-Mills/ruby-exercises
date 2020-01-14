# Sum of nums
# Write a program that, given a number, can find the sum of all the nums of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are nums of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these nums is 78.

# Write a program that can find the sum of the nums of a given set of numbers. If no set of numbers is given, default to 3 and 5.


# Problem: Write a program that given a number (Max) can find the sum of all the nums of particular number (default= 3,5) up to but not including (Max)

# set default arguments to 3,5
# for each argument add it to an array, then keep incrementing the number by the argument and adding it to the array until max - 1
# remove duplicates, then sum all the numbers in the array and return it

require 'pry-byebug'

# original solution: 

# class SumOfMultiples
#   attr_reader :nums

#   @@nums = [3,5]

#   def initialize(*nums)
#     @nums = nums
#   end

#   def self.to(max)
#     multiples = [0]
#     max_divisor = max - 1
#     current = 0
    
#     @@nums.each do |number|
#       current = number
#       until current > max_divisor do
#         multiples << current
#         current += number
#       end
#     end
#     multiples.uniq.reduce(:+)
#   end

#   def to(max)
#     multiples = [0]
#     max_divisor = max - 1
#     current = 0
    
#     nums.each do |number|
#       current = number
#       until current > max_divisor do
#         multiples << current
#         current += number
#       end
#     end
#     multiples.uniq.reduce(:+)
#   end
# end

# refactored, with help from LS top solution, having instance method invoke class method using different arguments

class SumOfMultiples

  def initialize(*nums)
    @nums = nums
  end

  def self.to(max, nums = [3,5])
    raise ArgumentError, "Input must be an Integer" if !max.is_a?(Integer)
    multiples = [0]
    max -= 1
    current = 0
    
    nums.each do |number|
      current = number
      until current > max do
        multiples << current
        current += number
      end
    end
    multiples.uniq.reduce(:+)
  end

  def to(max)
    self.class.to(max, @nums)
  end
end

p SumOfMultiples.to(-5) 
# p SumOfMultiples.to('banana') 
p SumOfMultiples.to(20) # => 78
p SumOfMultiples.to(1000000) 
p SumOfMultiples.new(7, 13, 17).to(20) # => 51


