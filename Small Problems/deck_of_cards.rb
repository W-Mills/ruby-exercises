# Deck of Cards
# Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

class Card
  include Comparable

  attr_reader :rank, :suit

  VALUE = { "Jack" => 11,
            "Queen" => 12,
            "King" => 13,
            "Ace" => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    if rank.is_a?(Integer)
      value = rank
    else
      value = VALUE[rank]
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

class Deck
  attr_accessor :deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    fresh_deck
  end

  def draw
    fresh_deck if deck.empty?
    deck.pop
  end

  def fresh_deck
    self.deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle!
  end
end

# The Deck class should provide a #draw method to draw one card at random. If the deck runs out of cards, the deck should reset itself by generating a new set of 52 cards.

# Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
# Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.


