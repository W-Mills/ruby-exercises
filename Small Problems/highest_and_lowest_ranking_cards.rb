# Highest and Lowest Ranking Cards
# Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects:

# class Card
#   include Comparable

#   attr_reader :rank, :suit

#   VALUE = { "Jack" => 11,
#             "Queen" => 12,
#             "King" => 13,
#             "Ace" => 14 }

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def value
#     if rank.is_a?(Integer)
#       value = rank
#     else
#       value = VALUE[rank]
#     end
#     value
#   end

#   def <=>(other)
#     value <=> other.value
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end
# end

# For this exercise, numeric cards are low cards, ordered from 2 through 10. Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher than Queens, and Aces are higher than Kings. The suit plays no part in the relative ranking of cards.

# If you have two or more cards of the same rank in your list, your min and max methods should return one of the matching cards; it doesn't matter which one.

# Besides any methods needed to determine the lowest and highest cards, create a #to_s method that returns a String representation of the card, e.g., "Jack of Diamonds", "4 of Clubs", etc.

# Examples:

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8


# Output:

# 2 of Hearts
# 10 of Diamonds
# Ace of Clubs
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true

#____________________________________________________________________________

# Further Exploration
# You will need the original exercise solution for the next two exercises. If you work on this Further Exploration, keep a copy of your original solution so you can reuse it.

# Assume you're playing a game in which cards of the same rank are unequal. In such a game, each suit also has a ranking. Suppose that, in this game, a 4 of Spades outranks a 4 of Hearts which outranks a 4 of Clubs which outranks a 4 of Diamonds. A 5 of Diamonds, though, outranks a 4 of Spades since we compare ranks first. Update the Card class so that #min and #max pick the card of the appropriate suit if two or more cards of the same rank are present in the Array.

class Card
  include Comparable

  attr_reader :rank, :suit

  RANK_VALUE = { "Jack" => 11,
            "Queen" => 12,
            "King" => 13,
            "Ace" => 14 }

  SUIT_VALUE = { "Spades" => 4,
                "Hearts" => 3,
                "Clubs" => 2,
                "Diamonds" => 1 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    if rank.is_a?(Integer)
      value = [rank, SUIT_VALUE[suit]]
    else
      value = [(RANK_VALUE[rank]), SUIT_VALUE[suit]]
    end
    value
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(2, 'Diamonds'),
         Card.new(2, 'Clubs'),
         Card.new(3, 'Clubs')]

puts cards.min
puts cards.max

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades'),
         Card.new(8, 'Hearts'),
         Card.new(7, 'Hearts')]
puts cards.min
puts cards.max
