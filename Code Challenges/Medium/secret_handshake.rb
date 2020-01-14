# Secret Handshake
# Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret handshake.
# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
# The program should consider strings specifying an invalid binary as the value 0.


# Problem:
# => write a program that takes a decimal number and converts it to a binary number and then returns an array of commands based on this binary code:
## 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump

# 10000 = Reverse the order of the operations in the secret handshake.

# class SecretHandshake

#   def initialize(input)
#     if input.is_a?(Integer)
#       @binary = to_binary(input)
#     elsif input.is_a?(String) && !input.chars.include?(/[^01]/)
#       @binary = input
#     else
#       @binary = 0
#     end
#     @reverse_order = false
#   end

#   def to_binary(input)
#     input.to_s(2)
#   end

#   def commands
#     translate
#   end

#   private

#   attr_reader :binary

#   COMMANDS = { 1 => 'wink',
#                10 => 'double blink',
#                100 => 'close your eyes',
#                1000 => 'jump' }

#   def translate
#     cmds = []
#     binary_digits = @binary.chars.map(&:to_i)

#     until binary_digits.empty? do
#       decode = binary_digits.shift * (10 ** (binary_digits.size))
#       if decode == 10000
#         reverse_order = true
#         next
#       elsif decode == 0
#         next
#       end
#       cmds << COMMANDS[decode]
#     end
#     reverse_order ? cmds : cmds.reverse
#   end
# end

class SecretHandshake

  def initialize(input)
    if input.is_a?(Integer)
      @binary = to_binary(input)
    elsif input.is_a?(String) && !input.chars.include?(/[^01]/)
      @binary = input
    else
      @binary = 0
    end
    @reverse_order = false
  end

  def to_binary(input)
    input.to_s(2)
  end

  def commands
    translate
  end

  private

  attr_reader :binary

  COMMANDS = { 1 => 'wink',
               2 => 'double blink',
               4 => 'close your eyes',
               8 => 'jump' }

  def translate
    cmds = []
    binary_digits = @binary.chars.map(&:to_i)

    until binary_digits.empty? do
      decode = binary_digits.shift * (2 ** (binary_digits.size))
      if decode == 16
        reverse_order = true
        next
      elsif decode == 0
        next
      end
      cmds << COMMANDS[decode]
    end
    reverse_order ? cmds : cmds.reverse
  end
end


## Excellent solution by Dana Chen:
# class SecretHandshake
#   attr_reader :input

#   TABLE = { 1 =>'wink', 2 => 'double blink', 4 => 'close your eyes', 8 => 'jump' }

#   def initialize(input)
#     @input = input.to_i
#   end

#   def commands
#     unless input & 16 == 16 # Bitwise AND operator, converts int into binary and performs bitwise AND on representation
#       TABLE.select {|k, v| input & k == k }.values 
#     else
#       TABLE.select {|k, v| input & k == k }.values.reverse!
#     end
#   end
# end


handshake = SecretHandshake.new(31)

# handshake = SecretHandshake.new("1001")
# assert_equal ['wink'], handshake.commands
p handshake.commands


