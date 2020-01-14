# How to workd with a coding problem:

# => don't underestimate it; resist the urge to dive into code
# => read the description 3 times; produce an outline if necesary
# => communicate and clarify
# => test cases (happy paths, fail paths, edge cases (boundaries, bad input))
# => have a plan (algorithm), and verify with that
# => manage your energy
# => abstraction - sometimes there are small problems embedded within a bigger problem, abstract those small problems into seperate methods

# Challenge: 

# Consider a character set consisting of letters, a space and a point. Words consist of one or more, but at most 20 letters.

# An input text consists of one or more words separated from each other by one or more spaces and terminated by 0 or more spaces followed by a point. Input should be read from, and including , the first letter of the first word, up to and including the terminating point. The output text is to be produced such that successive words are sepearated by a single space with the last word being terminated by a single point. Odd words are copied in reverse order while even words are merely echoed. 
# For example, the input string "whats the matter with kansas." becomes "whats eht matter htiw kansas."
#BONUS POINTS: the characters must be read and printed one at a time


# Problem: (Started at 4:15pm, finished at 4:30pm, Time taken == 15 mins)
# => Take a string input consisting of one or more words seperated from each other by one or more spaces and terminated by 0 or more spaces followed by a point.
# => Input should be read from and including the first letter of the first word up to and including the terminating point.
# => The output text is to be produced such that successive words are seperated by a single space with the last word being terminated by a single point
# => Odd words are copied in reverse order while even words are merely echoed.

# Approach:
# => split input string on whitespace
# => remove any extra whitespace
# => remove period from final word if final char is a period
# => iterate over array of words
# =>  - if word index is even, add word to return_string
# =>  - if word index is odd, reverse word and add to return_string
# => return word string + "." at the end

# original solution:

def reverse_odd_words(string) 
  returned_string = []
  words = string.split(" ")
  words[-1][-1] = "" if words[-1][-1] == "."
  words.each_with_index do |word, index|
    if index.even?
      returned_string << word
    else
      returned_string << word.reverse
    end
  end
  returned_string.join(" ").strip + "." 
end


# Example:

p reverse_odd_words("whats     the    matter with kansas.") == "whats eht matter htiw kansas."
# by odd words it means words at odd indexes (index 1,3,5,7)

p reverse_odd_words("I am from    TORONTO   .") == "I ma from OTNOROT."
p reverse_odd_words("hello.") == "hello."
p reverse_odd_words("whats the    matter     with    kansas   .") == "whats eht matter htiw kansas."
p reverse_odd_words(".") == "."

