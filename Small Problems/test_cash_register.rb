require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'cash_register'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test

  def setup
    @register = CashRegister.new(100)
    @buy_hockey_stick = Transaction.new(85)
  end

  def test_accept_money

    @buy_hockey_stick.amount_paid = 85

    previous_amount = @register.total_money
    @register.accept_money(@buy_hockey_stick)
    current_amount = @register.total_money

    assert_equal(previous_amount + 85, current_amount)
  end

  def test_change

    @buy_hockey_stick.amount_paid = 100
    change_given = @register.change(@buy_hockey_stick)

    assert_equal(15, change_given)
  end

  def test_give_receipt

    assert_output("You've paid $85.\n") {@register.give_receipt(@buy_hockey_stick)}
  end

end

# 1) Test Accept Money Method - Cash Register
# We now have the foundation of our CashRegister test class set up. Let's start testing! We'll start with the CashRegister#accept_money method. Write a test for the #accept_money method.

# 2) Write a test for the method, CashRegister#change.

# 3) Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.

# 4) Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've changed the transaction class a bit to make testing this a bit easier. The Transaction#prompt_for_payment now reads as:



