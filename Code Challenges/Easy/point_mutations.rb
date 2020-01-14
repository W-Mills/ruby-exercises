# Point Mutations

# Write a program that can calculate the Hamming distance between two DNA strands.

# A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.

# The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

# This is called the 'Hamming distance'

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

# Problem:
# => write a program that takes a DNA string as input for a class DNA, and a method that compares the difference between characters at each index for a supplied DNA string
# => return the total number of differences at each index

# => create a class DNA with an initialize method that takes the original DNA strand
# => create a hamming_distance method that takes a DNA string as an argument, and compares it to the original DNA string
# =>  - if the strings are of different length, compare over the shorter length
# =>  - return the total number of characters at each index that are different

# Original Solution:

# class DNA
#   attr_reader :org_dna

#   def initialize(dna_string)
#     @org_dna = dna_string
#   end

#   def hamming_distance(dna)
#     ham_distance = 0
#     counter = 0
#     comparison_sample = dna.size < org_dna.size ? dna.size : org_dna.size
#     until counter > comparison_sample - 1 do
#       org_dna[counter] == dna[counter] ? false : ham_distance += 1
#       counter += 1
#     end
#     ham_distance
#   end
# end

# refactored:

class DNA
  attr_reader :org_dna

  def initialize(dna_string)
    @org_dna = dna_string
  end

  def hamming_distance(dna)
    ham_distance = 0
    comparison_sample = [org_dna.size, dna.size].min
    0.upto(comparison_sample - 1) do |index|
      ham_distance += 1 if org_dna[index] != dna[index] 
    end
    ham_distance
  end
end





