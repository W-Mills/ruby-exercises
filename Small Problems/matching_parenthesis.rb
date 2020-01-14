require 'pry'
# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Problem: Write a method that takes a string as an argument and returns true if all parenthesis in the string are properly balanced (matching pairs), false otherwise

# => edge cases: no parenthesis in string?
# => parenthesis in backwards order? i.e. )(
# => an odd number of parenthesis in the string

# Input: a string
# Output: true/false

# Data structure: ## Using an integer as a counter would've been great

# Algorithm:
# => use String#match against input string with lazy pattern matching for ( folloed by )

## original solution:
# def balanced?(string)
  # return true unless string.match(/[\(\)]/) 
  # return false if string.scan(/[\(\)]/).count.odd?
  ## solving this strictly with regex was unneccesarily difficult. 
  ## getting 
# end

DELIMITERS = [['[', ']'], ['(', ')'], ['{', '}']]

def balanced?(string)
  counter = 0
  count = 0
  string = string.gsub(/(?<=\w)'(?=\w)/, '')
  DELIMITERS.size.times do
    string.chars.each do |char|
      count += 1 if char == DELIMITERS[counter][0]
      count -= 1 if char == DELIMITERS[counter][1]
      break if count < 0
    end
    counter += 1
  end
  count.zero? && balanced_quotes?(string)
end

def balanced_quotes?(string)
  string.scan(/'/).size.even? && string.scan(/"/).size.even?
end



## from @sawa on Stack overflow:

# non_delimiters = /[^(){}\[\]]*/
# Paired = /\(#{non_delimiters}\)|\{#{non_delimiters}\}|\[#{non_delimiters}\]/
# Delimiter = /[(){}\[\]]/

# def balanced? string
#   string = string.dup
#   string.gsub!(Paired, "".freeze) while string =~ Paired
#   string !~ Delimiter
# end


## LS Solution:

# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end

# Examples:
p balanced?("harvey's friend sam") == true
p balanced_quotes?('"harvey') == false
p balanced_quotes?('"harvey"') == true
p balanced_quotes?('What is" this?') == false

p balanced?('What is" this?') == false

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

p balanced?('What [is] this?') == true
p balanced?('What is] this?') == false
p balanced?('What [is this?') == false
p balanced?('What [[is]]] up[') == false

# Note that balanced pairs must each start with a (, not a ).