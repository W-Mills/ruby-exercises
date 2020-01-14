# Roman Numerals
# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).

#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC
# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII
# See also: http://www.novaroma.org/via_romana/numbers.html


# Problem: Given a base10 integer, write a program to convert it to roman numerals

# => construct a hash with integer keys and roman numeral values

# => iterate over the base10 integer:
# => next if integer is 0
# => starting with the leftmost digit, convert it to Roman Numeral and add to RN string
# =>  - multiply it by 10 ** digits.size - 1, to get the "tens/hundreds/thousands etc..."
# =>  - if this number is not in the hash as a key, i.e. 20, reduce it the the first common key denomintor, and multiply the associated value i.e. 20 == 'X' + 'X'
# => move to the next digit, and convert it to RN and add to string
# => return the Roman Numeral string when no more digits remain
# => 

require 'pry-byebug'


# Original solution that has way too many steps:
# class Integer

#   ROMAN_NUMERALS = { 1 => "I", 
#                      2 => "II",
#                      3 => "III",
#                      4 => "IV",
#                      5 => "V",
#                      9 => "IX",
#                      10 => "X",
#                      20 => "XX",
#                      30 => "XXX",
#                      40 => "XL",
#                      50 => "L",
#                      90 => "XC",
#                      100 => "C",
#                      200 => "CC",
#                      300 => "CCC",
#                      400 => "CD",
#                      500 => "D",
#                      900 => "CM",
#                      1000 => "M",
#                      2000 => "MM",
#                      3000 => "MMM" }

#   def to_roman
#     roman_numeral = ''
#     digits = self.digits.reverse
#     num_digits = digits.size
#     digits.each_with_index do |digit, index|
#       next if digit == 0
#       numeral = digit * (10 ** (num_digits - index - 1))
#       if !ROMAN_NUMERALS.include?(numeral)
#         roman_numeral << to_roman_helper(numeral)
#       else 
#         roman_numeral << ROMAN_NUMERALS[numeral]
#       end
#     end
#     roman_numeral
#   end

#   def to_roman_helper(numeral)
#     roman_return = ""
#     biggest, remainder = [0,0]
#     ROMAN_NUMERALS.each_key do |key|
#       break if key > numeral
#       biggest = key
#       remainder = numeral % key
#     end
#     roman_return << ROMAN_NUMERALS[biggest]
    
#     if remainder > 0
#       roman_return << to_roman_helper(remainder)
#     end
#     roman_return
#   end
# end


# Much better Solution: (by LS student XULLNN)

class Integer
  ONES = %w(I II III IV V VI VII VIII IX)
  TENS = %w(X XX XXX XL L LX LXX LXXX XC)
  HUNDREDS = %w(C CC CCC CD D DC DCC DCCC CM)
  THOUSANDS = %w(M MM MMM)
  ROMAN_MARKS = [ONES, TENS, HUNDREDS, THOUSANDS]

  def to_roman
    roman_numeral = ''
    self.digits.each_with_index do |digit, index|
      next if digit == 0
      roman_numeral.prepend(ROMAN_MARKS[index][digit - 1])
    end
    roman_numeral
  end
end

p 700.to_roman == "DCC"
p 7.to_roman == "VII"
p 27.to_roman == "XXVII"
p 3000.to_roman == "MMM"
p 48.to_roman == "XLVIII"
p 1024.to_roman == "MXXIV"
p 575.to_roman == "DLXXV"
p 6.to_roman == "VI"
p 163.to_roman == "CLXIII"





