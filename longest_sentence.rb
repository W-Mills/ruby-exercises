# Longest Sentence
# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.


# Another Example

# Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

# The longest sentence in this book is 157 words long.

## Problem: write a program that reads the content of a text file, and prints the longest sentence in the file based on number of words
## => sentences may end with . ! ?
## => any sequence of chars should be treated as a word
## => print the longest sentence
## => print the number of words in the longest sentence

## input: a text file (.txt)

## output: 
## => a string, the longest in the txt file
## => an integer, the number of words in the longest sentence

## data structure: 
## => an array to hold the current longest sentence

## algorithm:
## => init an array that will hold the current_longest_sentence

## => write a method that counts for words as defined
## => this should output an integer

## => write a method that uses regex to match sentences as defined
## => store the sentence that matches the regex for sentence if sentence length is greater than the current longest sentence length

## => after regex finishes pattern matching entire text document, output the longest sentence, and the number of words in the sentence

## My original solution, that found the correct sentences, but gave slightly different word counts:

# def longest_sentence_finder(string)
#   current_longest = []
#   sentences = string.scan(/(\b[^.!?]+?[.!?])/)
#   sentences.each do |sentence|
#     if word_counter(sentence.to_s) > word_counter(current_longest.to_s)
#       current_longest = sentence
#     end
#   end
#   current_longest
# end

# def word_counter(sentence)
#   sentence.scan(/[^.!? ]+/).size
# end

# open("frankenstein.txt") do |file|
#   text = file.read
#   longest = longest_sentence_finder(text)
#   puts longest
#   puts
#   puts "The longest sentence found was: #{word_counter(longest.to_s)} words."
# end


def longest_sentence_finder(string)
  sentences = string.split(/\.|\?|!/)
  current_longest = sentences.max_by { |sentence| word_counter(sentence) }
end

def word_counter(sentence)
  sentence.to_s.split.size
end

open("frankenstein.txt") do |file| 
  longest = longest_sentence_finder(file.read)
  puts longest
  puts "Length: #{word_counter(longest)} words."
end



test_para = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal. Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this. But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."

## LS solution:

# text = File.read('frankenstein.txt')
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"

puts longest_sentence_finder(test_para)
p word_counter(longest_sentence_finder(test_para).to_s)

