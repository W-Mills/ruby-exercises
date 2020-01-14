# require 'minitest/autorun'
# require 'minitest/reporters'
# require_relative 'transaction'
# require_relative 'cash_register'

# Minitest::Reporters.use!

# class TrasactionTest < Minitest::Test
#   def setup
#     @buy_pucks = Transaction.new(20)
#   end

#   def test_prompt_for_payment
#     input = StringIO.new('20')
#     output = StringIO.new
#     @buy_pucks.prompt_for_payment(input: input, output: output)

#     assert_equal(20, @buy_pucks.amount_paid)
#   end
# end

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end
