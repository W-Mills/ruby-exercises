# What's the Output?
# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.


# Fluffy
# My name is FLUFFY.
# FLUFFY
# FLUFFY

# Further Exploration
# What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
# This code "works" because of that mysterious to_s call in Pet#initialize. However, that doesn't explain why this code produces the result it does. Can you?

## the local variable name is initialized as the integer 42
## then the fluffy object is instantized as a Pet object with the name of the string "42"
## then the local variable name is re-assigned to the value of 42 + 1 or the integer 43
## the fluffy object is unaffected by this change to the local variable name
## 



