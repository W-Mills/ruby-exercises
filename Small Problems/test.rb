=begin
Create a digital root function.

A digital root is the recursive sum of all the digits in a number.
Given n, take the sum of the digits of n.
If that value has two digits,
continue reducing in this way until a single-digit number is produced.
This is only applicable to the natural numbers.

Here's how it works:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6
=end

# Problem: Take an integer, and sum the digits
# => keep summing the digits until there is only a single-digit left
# => 
# => only will take natrual numbers as input (whole numbers)

# Input: An integer with any number of digits
# Output: An integer with only one digit

# Algorithm:
# => call the digits method on the argument integer
# => construct a loop
# => call sum on that array, and then chain digits again, so that it returns an array
# => break from the loop when single digit is left
# => return the single digit

def digital_root(int)
  digits = int.digits
  loop do
    digits = digits.sum.digits
    return digits.first if digits.size == 1
  end
end

p digital_root(7) == 7
p digital_root(16) == 7
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2 


=begin
Given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.

As an example:

alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" as a string.
=end

# Problem: 
# => take a string, and replace every letter with its integer position in the alphabet, starting from 1.
# => if any char is not a letter, ignore it and don't return it

# Input: a string
# Output: a string, with every letter replaced by a string-number

# Data Structure: An array for the alphabet, and another array to hold values

# Approach: 
# => create an alphabet array for each letter ("a".."z").to_a
# => convert string into chars array, downcasing all elements
# => init a new int_arr to contain the integers
# => iterate over the chars array using Array#each
# =>  - if element is included in the alphabet array:
# =>   - find the index value of the element
# =>    - shovel the alphabet value + 1 into the int_arr
# => join and return the arr as a string

def alphabet_position(string)
  alphabet_arr = ("a".."z").to_a
  chars_arr = string.downcase.chars
  int_arr = []
  chars_arr.each do |char|
    if alphabet_arr.include?(char)
      int_arr << alphabet_arr.find_index(char) + 1
    end
  end
 int_arr.join(" ")
end

p alphabet_position("") == ""
p alphabet_position("The") == "20 8 5" 
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"







