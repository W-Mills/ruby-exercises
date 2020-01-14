# Passing Parameters Part 3
# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

# 1)

gather(items) do |*veg, wheat|
  puts veg.join(', ')
  puts wheat
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
puts
# 2)

gather(items) do |apples, *veg, wheat|
  puts apples
  puts veg.join(", ")
  puts wheat
end

# # Let's start gathering food.
# # apples
# # corn, cabbage
# # wheat
# # We've finished gathering!
puts 
# # 3)

gather(items) do |apples, *other|
  puts apples
  puts other.join(', ')
end

# # Let's start gathering food.
# # apples
# # corn, cabbage, wheat
# # We've finished gathering!

# # 4)
puts

gather(items) do |apples, *other, wheat|
  puts "#{apples}, #{other.join(", ")} and #{wheat}"
end

# # Let's start gathering food.
# # apples, corn, cabbage, and wheat
# # We've finished gathering!
