# Madlibs Revisited
# Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

# The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.

# Problem: 
# => create a text file with "keys" for types of data (noun, verb, adjective, adverb)
# => create arrays for various 'options' that those keys could be randomly replaced with
# => write a method that reads the input text file
# =>  - and replaces each instance of "noun" with a randomly selected word from the nouns array using Array#each
# =>   - if word == noun =>  
# => n_rng = rand(NOUN.size)word noun[n_rng]
# => 



# Input: text from a text file that I have created
# Output: prints that text, but with plugged in nouns, verbs, adjectives and adverbs (randomly selected)

# Example output:

# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

 
NOUNS = %w(cat sock ship hero monkey baby match people history way art bob frank joe hillary family government health system meat year thanks data food).freeze
# p noun.size == 24

VERBS = %w(is are has see get need would find take want does learn become choose develop determine remember bring improve maintain supply follow refer solve)
# p verb.size == 24

ADJECTIVES = %w(bitter bland delicious fruity gingery boiling breezy bumpy chilly cold prickly rough shaggy warm wet uneven tight slippery smooth soft)
# p adjective.size == 20

ADVERBS = %w(abrubtly unevenly beautifully delicately delightfully frimly lightly truthfully quickly wearily willfully downstairs everywhere here inside outside somewhere underground upstairs early first last never regularly today tomorrow almost enough quite so too very)
# p adverb.size == 32

File.open('madlibs_rv.txt') do |file|
  file.each do |line|
    puts format(line, noun:       NOUNS.sample,
                      verb:       VERBS.sample,
                      adjective:  ADJECTIVES.sample,
                      adverb:     ADVERBS.sample)
  end
end

