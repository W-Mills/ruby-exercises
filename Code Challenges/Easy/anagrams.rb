# Anagrams
# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

# Problem: given a word and an list of possible anagrams, select and return all the correct anagrams from the list

# I/O:
# => input is a string word, plus a list of possible anagrams
# => return an array containing all the anagrams

# Rules:
# => anagrams are the same characters re-arranged to form a different word
# => the same word is not an anagram
# => anagrams are case insensitive
# => anagrams must be the same number of characters as initial word
# => 

# Algorithm:
# => set given word to instance variable "original word" (and downcase it)
# => 
# => in instance method detector:
# => use as a getter method to retrieve downcased original word

# => In instance method match (with an array parameter):
# => reject word if list includes same word, or if word length is not the same as initial word length

# => iterate over list with select: if the possible word downcased + sorted characters == initial word.chars.sort then select that word
# => return that selected list

# Original solution:

# class Anagram
#   attr_reader :original_word

#   def initialize(original_word)
#     @original_word = original_word.downcase
#   end

#   def detector
#     @original_word
#   end

#   def match(array)
#     array.select do |word|
#       word = word.downcase
#       if word == original_word || word.length != original_word.length
#         next
#       elsif word.chars.sort == original_word.chars.sort 
#         word
#       end
#     end
#   end
# end

# Refactored:

class Anagram
  attr_reader :original_word

  def initialize(original_word)
    @original_word = original_word.downcase
  end

  def match(array)
    array.select do |word|
      word = word.downcase
      next if word == original_word || word.length != original_word.length
      word if word.chars.sort == original_word.chars.sort 
    end
  end
end

bob = Anagram.new('blah')
