# Luhn Algorithm
# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.
# For any digits that thus become 10 or more, subtract 9 from the result.
# 1111 becomes 2121.
# 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
# Add all these digits together.
# 1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
# 8763 becomes 7733, and 7+7+3+3 is 20.
# If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

# Write a program that, given a number

# Can check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid.
# Can return the checksum, or the remainder from using the Luhn method.
# Can add a check digit to make the number valid per the Luhn formula and return the original number plus that digit. This should give "2323 2005 7766 3554" in response to "2323 2005 7766 355".
# About Checksums:

# A checksum has to do with error-detection. There are a number of different ways in which a checksum could be calculated.

# When transmitting data, you might also send along a checksum that says how many bytes of data are being sent. That means that when the data arrives on the other side, you can count the bytes and compare it to the checksum. If these are different, then the data has been garbled in transmission.

# In the Luhn problem the final digit acts as a sanity check for all the prior digits. Running those prior digits through a particular algorithm should give you that final digit.

# It doesn't actually tell you if it's a real credit card number, only that it's a plausible one. It's the same thing with the bytes that get transmitted -- you could have the right number of bytes and still have a garbled message. So checksums are a simple sanity-check, not a real in-depth verification of the authenticity of some data. It's often a cheap first pass, and can be used to quickly discard obviously invalid things.




# Problem: 
# => Write a program that can, given a number:
# => - check if it is valid per the Luhn formula
# => - return the checksum (the remainder from using the Luhn method)
# => - add a check digit to make the number valid per the Luhn formula, and return that original number + new digit

# Approach:
# => write formula to iterate over num, determining Luhn formula validity
# =>  - counting digits from right to left, double the value of each 2nd digit
# =>   - if that double-value > 9, subtract 9 from this value
# =>  - sum these new digits => this is the checksum

# =>   - if the last digit of the checksum == 0, then valid Luhn formula


# =>  if num is not a valid Luhn number
# =>   - find out the minimum digit needed to make a valid'checksum' 
# =>   - add this digit to the end of num, and return this new num

# class Luhn
#   attr_reader :num, :transformed, :checksum

#   def initialize(integer)
#     @num = integer
#   end

#   def addends
#     transformed = num.digits.map.with_index do |digit, index|
#       if index.even?
#         digit
#       else
#         n = digit * 2
#         n > 9 ? n - 9 : n
#       end
#     end
#     @transformed = transformed.reverse
#   end

#   def checksum
#     addends #if transformed == nil 
#     @checksum = transformed.reduce(:+)
#   end

#   def valid?
#     checksum #if @checksum == nil
#     @checksum % 10 == 0
#   end

#   def self.create(num)
#     luhn_num = num
#     digit = 0
#     loop do
#       nums = luhn_num.digits
#       digit == 0 ? nums.unshift(digit) : nums.shift && nums.unshift(digit)
#       luhn_num = nums.reverse.join.to_i
#       break if Luhn.new(luhn_num).valid?
#       digit += 1
#     end
#     luhn_num
#   end
# end

# Refactored: (borrowing the idea to use Integer#upto for the create method from LS Student Melissa Manousos, as well as multiplying by 10 to create *space* for a new final digit )

class Luhn
  attr_reader :num

  def initialize(integer)
    @num = integer
  end

  def addends
    transformed = num.digits.map.with_index do |digit, index|
      if index.even?
        digit
      else
        n = digit * 2
        n > 9 ? n - 9 : n
      end
    end
    transformed.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    0.upto(9) do |digit|
      luhn_num = num * 10 + digit
      return luhn_num if Luhn.new(luhn_num).valid?
    end
  end
end

number = Luhn.create(873_956)
p number #== 8_739_567


# test_1 = Luhn.new(12_121)
# p test_1.addends #== [1, 4, 1, 4, 1]
# p test_1.checksum
# p test_1.valid?

# luhn = Luhn.new(8631)
# p luhn.addends # [7, 6, 6, 1]
# p luhn.valid?

# luhn_2 = Luhn.new(4913)
# p luhn_2.checksum #== 22
# p luhn_2.valid?





