# Scrabble Score
# Write a program that, given a word, computes the scrabble score for that word.

# Letter Values
# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Examples
# "cabbage" should be scored as worth 14 points:

# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E
# And to total:

# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14


# Problem:
# => write a program that given a word, computes the "scrabble score" for that word
# => the scrabble score is the total value of all the characters in the word, with each character given a specific value
# => deconstruct the word to it's chars
# =>  iterate over those chars, finding the value for that char and adding its value to an accumulator
# => return the total accumulated value

require 'pry-byebug'

# original solution:

# class Scrabble
#   attr_reader :word
  
#   VALUE_HASH = { 1 =>  %w(a e i o u l n r s t),
#                  2 => %w(d g),
#                  3 => %w(b c m p),
#                  4 => %w(f h v w y),
#                  5 => %w(k),
#                  8 => %w(j x),
#                  10 => %w(q z) }

#   def initialize(word)
#     @word = word
#   end

#   def score
#     s_score = 0
#     if word
#       word.downcase.chars.each do |letter|
#         VALUE_HASH.each do |key, value|
#           s_score += key if value.include?(letter)
#         end
#       end
#     end
#     s_score
#   end

#   def self.score(new_word)
#     Scrabble.new(new_word).score
#   end
# end

# alternate solution, using strings as keys for value hash:

class Scrabble
  attr_reader :word
  
  VALUE_HASH = { 'aeioulnrst' => 1,
                 'dg' => 2,
                 'bcmp' => 3,
                 'fhvwy' => 4,
                 'k' => 5,
                 'jx' => 8,
                 'qz' => 10 }

  def initialize(word)
    @word = word
  end

  def score
    s_score = 0
    if word
      word.downcase.chars.each do |letter|
        VALUE_HASH.each do |key, value|
          s_score += value if key.include?(letter)
        end
      end
    end
    s_score
  end

  def self.score(new_word)
    Scrabble.new(new_word).score
  end
end




