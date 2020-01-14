# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Problem: write a method that takes a string and returns a hash containing 3 entries: 
# => 1) the % of chars in string that are lowercase
# => 2) the % of chars in string that are uppercase
# => 3) the % of chars that are neither

# Input: a string
# Output: a hash

# Data structure: arrays for each type of entry

# Algorithm: 
# => init three arrays, for each entry type
# => use String#scan to populate each of these arrays with appropriate data
# => compare size of these arrays to total input string size for %
# => format these percentages into a hash as output

# Code:

def letter_percentages(string)
  percentages = {}
  lowercase = string.scan(/[a-z]/)
  uppercase = string.scan(/[A-Z]/)
  neither = string.chars.reject do |char| 
    lowercase.include?(char) || uppercase.include?(char)
  end
  percentages[:lowercase] = lowercase.size.fdiv(string.size) * 100
  percentages[:uppercase] = uppercase.size.fdiv(string.size) * 100
  percentages[:neither] = neither.size.fdiv(string.size) * 100
  percentages
end


# Examples

p letter_percentages('abCdef 123')  == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef')  == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
