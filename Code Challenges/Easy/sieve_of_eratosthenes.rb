# Sieve of Eratosthenes
# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

# Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:

# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)
# Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.

# Notice that this is a very specific algorithm, and the tests don't check that you've implemented the algorithm, only that you've come up with the correct list of primes.

# Wikipedia Pseudocode
# The sieve of Eratosthenes can be expressed in pseudocode, as follows:[7][8]

#  Input: an integer n > 1.
 
#  Let A be an array of Boolean values, indexed by integers 2 to n,
#  initially all set to true.
 
#  for i = 2, 3, 4, ..., not exceeding √n:
#    if A[i] is true:
#      for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n:
#        A[j] := false.
 
#  Output: all i such that A[i] is true.

# Problem: Find all the primes from 2 up to a given number using the "sieve of eratosthenes". 
# => from 2 upto limit, construct an array with true values
# => iterate over this array, making all the multiples of current number false (number is not prime)
# => if array[index] == true, 

# original solution:

# require 'cmath'

# class Sieve
#   attr_accessor :array
#   attr_reader :sqrt_of_max

#   def initialize(integer)
#     @array = (1..integer).to_a
#     @array[0] = nil
#     @sqrt_of_max = CMath.sqrt(integer)
#   end

#   def primes
#     index = 1
#     until index > sqrt_of_max
#       temp_ind = index
#       loop do
#         if array[index]
#           temp_ind += array[index]
#           break if temp_ind > array.size
#           array[temp_ind] = nil
#         else
#           break
#         end
#       end
#       index += 1
#     end
#     array.compact
#   end
# end

# refactored:

class Sieve
  attr_accessor :array
  attr_reader :sqrt_of_max

  def initialize(number)
    raise ArgumentError, 'Input must be 2 or greater' if number < 2
    @array = (2..number).to_a
    @sqrt_of_max = Math.sqrt(number)
  end

  def primes
    index = 0
    until index > sqrt_of_max
      temp_ind = index
      while array[index] do
          temp_ind += array[index]
          break if temp_ind > array.size
          array[temp_ind] = nil
      end
      index += 1
    end
    array.compact
  end
end

p Sieve.new(1000000).primes




