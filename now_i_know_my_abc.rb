require 'pry'
# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Problem: write a method that returns true if the word passed in as an argument can be spelled from a set of blocks, (using each block only once) false otherwise.

# Input: a string
# Output: true or false

# Data structure: an array containing sub-arrays which represent each block

# Algorithm:
# => create an array of sub-arrays which represent each block
# => within the `block_word?` method, init an array to hold the still available blocks by cloning the original spelling block array
# => within the `block_word?` method, init an array to 'hold' blocks that have been used during iteration
# => iterate over the string characters to check if each character matches an available spelling block
# => return true if each character can use an available block, false otherwise

# Code: 

SPELLING_BLOCKS = [['b','o'], ['x','k'], ['d','q'], ['c','p'], ['n','a'],
['g','t'], ['r','e'], ['f','s'], ['j','w'], ['h','u'], ['v','i'], ['l','y'],
['z','m']]

def block_word?(string)
  available_blocks = SPELLING_BLOCKS.clone
  used_blocks = []
  string.downcase.chars.each do |char|
      available_blocks.each do |block|
      used_blocks << block if block.include?(char) 
    end
    available_blocks.delete(used_blocks[-1]) if used_blocks[-1].include?(char)
  end
  return true if used_blocks.size == string.length
  false
end


# Examples:

p block_word?('BAATCH') == false
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('nare') == false
p block_word?('soup') == true
p block_word?('bxdcngrfjhiym') == true


# LS Solution:
# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end
