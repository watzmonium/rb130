require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < Minitest::Test

  def setup
    @default_transaction = Transaction.new(50)
  end

  def test_transaction_prompt_for_payment
    input = StringIO.new("50\n")
    output = StringIO.new
    @default_transaction.prompt_for_payment(input: input, output: output)
    assert_equal(50, @default_transaction.amount_paid)
  end
end
