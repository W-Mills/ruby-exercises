# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.


## Original attempt that has issues when a spelled number has punctuation touching it. I will re-write this using a regex to resolve the issue:

# def word_to_digit(string)
#   changed_string = ''
#   string.split.each do |element|
#     case element
#       when 'one' then changed_string << '1 '
#       when 'two' then changed_string << '2 '
#       when 'three' then changed_string << '3 '
#       when 'four' then changed_string << '4 '
#       when 'five' then changed_string << '5 '
#       when 'six' then changed_string << '6 '
#       when 'seven' then changed_string << '7 '
#       when 'eight' then changed_string << '8 '
#       when 'nine' then changed_string << '9 '
#       when 'zero' then changed_string << '0 '
#       else changed_string << element + " "
#     end
#   end
#   changed_string.rstrip
# end  

NUMBERS_HASH = { 'one' => '1',
                 'two' => '2',
                 'three' => '3',
                 'four' => '4',
                 'five' => '5',
                 'six' => '6',
                 'seven' => '7',
                 'eight' => '8',
                 'nine' => '9',
                 'zero' => '0'
                }.freeze

def word_to_digit(string)
  NUMBERS_HASH.keys.each do |words|
    string.gsub!(/\b#{words}\b/i, NUMBERS_HASH[words])
  end
  string
end

## A concise solution I liked from LS Student Karthick Soolapani:

# ENG_NUM = %w(zero one two three four five six seven eight nine)

# def word_to_digit(string)
#   string.gsub!(/\w+\s*/) { |word| ENG_NUM.index(word.downcase.strip) || word }
#   string.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
#   string
# end

# Example:

p word_to_digit('Please call me at four one six five Five five One two three four. Thanks.') #== 'Please call me at 4 1 6 5 5 5 1 2 3 4. Thanks.'


# Further Exploration
# There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.

## This is easily achieved by adding the case-insensitive flag to the end of the regex. (/i)

# Can you change your solution this so the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

# What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890".

