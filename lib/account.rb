class Account
  attr_reader :balance, :transactions

  def initialize(accout_details)
    @name = accout_details[:name]
    @balance = 0
    @transactions = []
  end

  def name
    @name.to_s
  end

  def deposit(amount)
    fail "Please make sure that deposit amount is positive integer" if amount < 0
    @balance += amount
  end

end
