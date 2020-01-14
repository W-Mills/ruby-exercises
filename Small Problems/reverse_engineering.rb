# Reverse Engineering
# Write a class that will display:

# ABC
# xyz
# when the following code is run:

class Transform < String

  def initialize(string)
    @string = string
  end

  def uppercase
    @string.upcase
  end

  def self.lowercase(chars)
    chars.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')