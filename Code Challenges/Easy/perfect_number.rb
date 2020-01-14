# Perfect Number
# The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
# Write a program that can tell if a number is perfect, abundant or deficient.


# Problem: write a program that returns either the string 'perfect', 'abudant' or 'deficient', depending on what type of number is input 

# => find all the divisors of given number (except for self)
# =>  - iterate from 1..upto(num - 1), checking for numbers that % == 0
# =>   - if so, include that number as a divisor

# => compare sum of divisors to number, and return based on:

# =>  Perfect: Sum of factors == number
# =>  Abundant: Sum of factors > number
# =>  Deficient: Sum of factors < number

# original solution:

# class PerfectNumber
#   def self.classify(num) 
#     raise 'RunTimeError' if num < 1
#     divisors = []
#     1.upto(num - 1) do |n|
#       divisors << n if num % n == 0
#     end
#     if divisors.sum == num
#       "perfect"
#     elsif divisors.sum > num
#       "abundant"
#     elsif divisors.sum < num
#       "deficient"
#     end
#   end
# end 

# refactored:

class PerfectNumber
  def self.sum_of_divisors(num)
    raise 'RunTimeError' if (num < 1 || !num.integer?)
    divisors = []
    1.upto(num - 1) do |n|
      divisors << n if num % n == 0
    end
    divisors.sum
  end

  def self.classify(num) 
    sum = sum_of_divisors(num)
    if sum == num
      "perfect"
    elsif sum > num
      "abundant"
    elsif sum < num
      "deficient"
    end
  end
end 

#p PerfectNumber.classify(0)
#p PerfectNumber.classify(5.5)
p PerfectNumber.classify(6)
p PerfectNumber.classify(13)
p PerfectNumber.classify(28)
p PerfectNumber.classify(12)