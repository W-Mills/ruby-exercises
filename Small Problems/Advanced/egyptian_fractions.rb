# Egyptian Fractions
# A Rational Number is any number that can be represented as the result of the division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the left is called the numerator, and the number to the right is called the denominator.

# A Unit Fraction is a rational number where the numerator is 1.

# An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:

# 1   1    1    1
# - + - + -- + --
# 2   3   13   15
# Every positive rational number can be written as an Egyptian fraction. For example:

#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6
# Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

# To create an Egyptian fraction representation (the denominators):

# => def a method with a target_value (rational) as an input
# => init an array to hold the denominators
# => init a var for unit_denominators to 1 (i.e. 1/1, 1/2, 1/3, 1/4, 1/5 etc...)
# => create an until loop, until the target_value == 0
# =>  - init a variable called unit_fraction to Rational(1, unit_denominator)
# =>  - create an if/else statement:
# =>   - if the unit_fraction is equal or less than the target_value
# =>    - re-assign the target_value to itself minus the unit fraction
# =>    - shovel the unit_denominator into the denominators array
# =>   - increment the unit_denominator by 1
# =>  - end the until loop
# => return the denominators array

def egyptian(rational)
  denominators = []
  unit_denominator = 1
  until rational == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= rational
      rational -= unit_fraction
      denominators << unit_denominator
    end
    unit_denominator += 1
  end
  denominators
end

# p egyptian(6/7r)
# p egyptian(5/6r)
# p egyptian(4/5r)
# p egyptian(3/16r)

# To de-code an array of egyptian denominators into a smaller rational number:

# def a method that takes an array of denominators as a parameter
# => call Array#reduce with an empty rational number as an accumulator
# =>  - with method parameters |accumulator, denominator|
# =>  accumulate all the unit fractions by converting all the denominators into rational numbers (i.e. 1/1, 1/2, 1/3 etc...)

def unegyptian(denominators)
  denominators.reduce(0/1r) do |accumulator, denominator|
    accumulator += Rational(1, denominator)
  end
end


# Examples:

# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Every rational number can be expressed as an Egyptian Fraction. In fact, every rational number can be expressed as an Egyptian Fraction in an infinite number of different ways. Thus, the first group of examples may not show the same values as your solution. They do, however, show the expected form of the solution. The remaining examples merely demonstrate that the output of egyptian can be reversed by unegyptian.