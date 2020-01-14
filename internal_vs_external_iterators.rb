# In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, reset your Enumerator. Finally, reprint those same 7 factorials using your Enumerator object as an "Internal Iterator".

# You can find almost everything you need for this exercise in the documentation for Enumerator. In particular, check out the ::new method; it should prove a good starting point for this exercise. Some further details about internal vs external iterators are mentioned at the start of that documentation, so make sure to read that section. Keep in mind that that section can be a bit dense; if you don't understand everything about it, that's ok.

# The wikipedia page on factorials may also be of some use.

# Two final hints:

# You'll only need 3 Enumerator methods to complete this exercise.
# An Enumerator also implements the Enumerable module. Keep this in mind, as it may make certain parts of this exercise easier to write.


def factorial(num)
  (1..num).reduce(:*)
end

factorials = Enumerator.new do |yielder|
  number = 0
  loop do
    number += 1
    yielder.yield factorial(number)
  end
end


7.times { puts factorials.next }
factorials.rewind # is this necessary? 
puts factorials.take(7)
factorials.first(7).each { |factorial| puts factorial }


## LS solution:

# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0
#   loop do
#     accumulator = number.zero? ? 1 : accumulator * number
#     yielder << accumulator
#     number += 1 
#   end    
# end

# puts factorial.take(7)
# factorial.rewind

# factorial.each_with_index do |n, i|
#   puts n
#   break if i == 6
# end