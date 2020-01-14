# Word Count
# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

# Problem: Write a program that given a phrase(string), counts the occurences of each word in that phrase
# => normalize all case to downcased
# => ignore punctuation
# => include string numbers
# => handles cramped lists with no spaces
# => includes apostraphes in words, but not double single quotes
# => 

# => Create a class Phrase that takes a string for constructor
# => def a word_count instance method
# => init an empty counts hash that will use the unique words as keys and counts as values
# => 
# => return counts hash

# Original brute force solution (satisfies further exploration too):



# class Phrase
#   attr_reader :phrase, :words

#   def initialize(string)
#     @phrase = string.downcase
#     extract_words
#   end

#   def word_count
#     counts = {}
#     words.each do |word|
#       counts[word] ? counts[word] += 1 : counts[word] = 1
#     end
#     counts
#   end

#   def extract_words
#     filter_words = phrase.split(" ").map { |item| item.split(',')}.flatten
#     words = filter_words.each { |word| word.gsub!(/[^a-zA-Z0-9']/, '') }
#     final_words = words.map { |word| correct_single_quotes(word) }
#     @words = final_words.reject { |word| word == "" }
#   end

#   def correct_single_quotes(string)
#     if string.count("'") > 1
#       string[1..-2]
#     else
#       string
#     end
#   end
# end

# Doing it fully without regex (and proving how useful regex is sometimes:

class Phrase
  attr_reader :phrase, :words
  WORD_CHARS = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a + ["'"]

  def initialize(string)
    @phrase = string.downcase
    extract_words
  end

  def word_count
    counts = Hash.new(0)
    words.each { |word| counts[word] += 1 }
    counts
  end

  def extract_words
    filter_words = phrase.split(" ").map { |item| item.split(',')}.flatten
    words = filter_words.map do |word|
      word.chars.map { |char| WORD_CHARS.include?(char) ? char : "" }.join
    end
    final_words = words.map { |word| correct_single_quotes(word) }
    @words = final_words.reject { |word| word == "" }
  end

  def correct_single_quotes(string)
    if string.count("'") > 1
      string[1..-2]
    else
      string
    end
  end
end




# refactored solution after looking at other solutions and remembering how to use String#scan

# class Phrase
#   attr_reader :phrase

#   def initialize(string)
#     @phrase = string.downcase
#   end

#   def word_count
#     counts = {}
#     words = phrase.scan(/\b[\w']+\b/)
#     words.each { |word| counts[word] ? counts[word] += 1 : counts[word] = 1 }
#     counts
#   end
# end

# refactored further, using Hash.new with default value of 0, and differentiating between aposthraphe 's' to end a word vs single quotations: 

# class Phrase
#   attr_reader :phrase

#   def initialize(string)
#     @phrase = string.downcase
#   end

#   def word_count
#     counts = Hash.new(0)
#     words = phrase.scan(/\b[\w']+/)
#     final_words = words.map do |word| 
#       if word[-1] == "'" 
#         word[-2] == "s" ? word : word[0..-2]
#       else word
#       end
#     end
#     final_words.each { |word| counts[word] += 1}
#     counts
#   end
# end


# phrase = Phrase.new('car : carpet as java : javascript!!&@$%^&')
# p phrase.word_count

# phrase_2 = Phrase.new('one,two,three')
# p phrase_2.word_count

# phrase_3 = Phrase.new("First: don't laugh. Then: don't cry.")
# p phrase_3.word_count

# phrase_4 = Phrase.new("Joe can't tell between 'large' and large, or Jess' helpfulness.")
# p phrase_4.word_count

phrase_5 = Phrase.new("Joe can't tell between 'large' and large.")
p phrase_5.word_count


