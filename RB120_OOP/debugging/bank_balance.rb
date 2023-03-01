=begin

In the BankAccount#balance= method, the previous design was trying to return a boolean (true or false) and assign it to the local variable success.
However, all assignments (include custom assignment methods, like BankAccount#balance=) will always return the value of the assignment regardless of whatever the last evaluated line is of the method definition.
This means that -30 is returned and assigned to local variable success. 

This can be resolved by using the  BankAccount#valid_transaction? method to convert the new, preliminary balance into a boolean.

=end

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && valid_transaction?(balance - amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50


=begin
Further Exploration

The return value of a setter method will be the argument, including any mutations that occur within the setter method body.
This makes sense since the setter method likely returns the object passed in as an argument.

Example below.
=end

class Test
  attr_reader :value
  
  def initialize
    @value = 'initial'
  end
  
  def value=(arg)
    @value = arg
    arg << '+mutated'
  end
end

ex = Test.new
p ex.value = "argument"