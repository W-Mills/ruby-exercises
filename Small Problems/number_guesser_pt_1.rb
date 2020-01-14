require 'pry'
# Number Guesser Part 1
# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

class GuessingGame
  attr_reader :num_to_guess
  attr_accessor :guess_number, :guess

  NUM_OF_GUESSES = 7
  RANGE = (1..100).to_a

  def initialize
    @num_to_guess = RANGE.sample
    @guess_number = 0
    @guess = nil
  end

  def play
    system("clear") || system("cls")
    until guess_number == NUM_OF_GUESSES || win?
      display_guesses_remaining
      make_guess
      display_guess_result
    end
    if win?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
      puts "The correct number was #{num_to_guess}"
    end
  end

  def display_guesses_remaining
    guesses_remaining = (NUM_OF_GUESSES - guess_number)
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def make_guess
    loop do
      puts "Enter a number between 1 and 100:"
      self.guess = gets.chomp.to_i
      break if (1..100).cover?(guess)
      puts "Invalid guess"
    end
    self.guess_number += 1
  end

  def display_guess_result
    if guess == win?
      puts "That's the number!"
    elsif guess < num_to_guess
      puts "Your guess is too low."
    elsif guess > num_to_guess
      puts "Your guess is too high."
    end
  end

  def win?
    guess == num_to_guess
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
# Note that a game object should start a new game with a new number to guess with each call to #play.