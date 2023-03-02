require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 50
  end
  
  def test_accept_money
    prior_total = @cash_register.total_money
    increase = @transaction.amount_paid

    @cash_register.accept_money(@transaction)
    
    current_total = @cash_register.total_money
    
    assert_equal(prior_total + increase, current_total)
  end
  
  def test_change
    paid = @transaction.amount_paid
    
    change = @cash_register.change(@transaction)
    
    assert_equal(paid - @transaction.item_cost, change)
  end
  
  def test_receipt
    paid = @transaction.amount_paid
    
    anticipated_receipt = "You've paid $#{paid}.\n"
    
    assert_output(anticipated_receipt) {@cash_register.give_receipt(@transaction)}
  end
end