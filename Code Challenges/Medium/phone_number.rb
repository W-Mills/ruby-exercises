# Phone Number
# Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.

# The rules are as follows:

# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number

# Problem:
# => Write a program that cleans up user-entered phone numbers so they can be sent as SMS messages.
# => BAD_NUM = 10 * 0
# => if num < 10 digits => return BAD_NUM
# => if num == 10 digits == return num
# => if num == 11 digits && num.first == 1, shift 1 and return the other 10
# => if num == 11 digits && num.first != 1, return BAD_NUM
# => if num > 11 digits, return BAD_NUM
# => 
# => create a to_s method for 'pretty print' that adds parenthesis and spaces
# => create an area_code method that retrieves area code

# Edge Cases:
# => non digit input => BAD_NUM
# => 

# Approach:
# => create a class PhoneNumber
# =>  - initialize should take a string input
# =>  - within initialize => assign number based on conditions above
# =>  - getter method for number
#
# =>  

class PhoneNumber
  BAD_NUM = "0" * 10

  attr_reader :number

  def initialize(string_num)
    assign_num(string_num)
  end

  def assign_num(string_num)
    @number = BAD_NUM if string_num.match /[^\d\s().\-]/
    return if @number

    digits = (string_num.scan /\d+/).join
    @number = case 
              when digits.size < 10 then BAD_NUM
              when digits.size == 10 then digits
              when digits.size == 11 then @eleven = true
              when digits.size > 11 then BAD_NUM
              end
    if @eleven
      digits[0] == '1' ? @number = digits[1, 10] : @number = BAD_NUM
    end
  end

  def to_s
    "(#{area_code}) #{number[3,3]}-#{number[6,4]}"
  end

  def area_code
    "#{number[0,3]}"
  end
end



