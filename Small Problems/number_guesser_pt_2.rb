class GuessingGame
  def initialize(low_number, high_number)
    @guess_number = 0
    @latest_guess = nil
    @range = (low_number..high_number).freeze
    @num_of_guesses = (Math.log2(range.size).round + 1).freeze
    @num_to_guess = rand(range)
  end
  
  def play
    system("clear") || system("cls")
    until guess_number == num_of_guesses || win?
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

  protected

  attr_accessor :guess_number, :latest_guess
  attr_reader :num_to_guess, :range, :num_of_guesses

  def display_guesses_remaining
    guesses_remaining = (num_of_guesses - guess_number)
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def make_guess
    loop do
      puts "Enter a number between #{range.first} and #{range.last}:"
      self.latest_guess = gets.chomp.to_i
      break if range.cover?(latest_guess)
      puts "Invalid guess"
    end
    self.guess_number += 1
  end

  def display_guess_result
    if latest_guess == win?
      puts "That's the number!"
    elsif latest_guess < num_to_guess
      puts "Your guess is too low."
    elsif latest_guess > num_to_guess
      puts "Your guess is too high."
    end
  end

  def win?
    latest_guess == num_to_guess
  end
end

game = GuessingGame.new(1, 2500)
game.play

