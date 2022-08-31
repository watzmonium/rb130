require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class RegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @default_transaction = Transaction.new(20)
  end

  def test_accept_money
    @default_transaction.amount_paid = 5
    starting_balance = @register.total_money
    @register.accept_money(@default_transaction)

    assert_equal(starting_balance + 5, @register.total_money)
  end

  def test_register_change
    @default_transaction.amount_paid = 30
    reg_change = @register.change(@default_transaction)
    assert_equal(10, reg_change)
  end

  def test_register_give_receipt
    assert_output("You've paid $20.\n") { @register.give_receipt(@default_transaction) }
  end
end