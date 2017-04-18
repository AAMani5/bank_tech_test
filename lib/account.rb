require 'date'

class Account
  attr_reader :balance, :transactions

  def initialize(accout_details)
    @name = accout_details[:name]
    @balance = 0
    @transactions = []
    @transaction = accout_details[:transaction] || Struct.new(:amount, :date)
  end

  def name
    @name.to_s
  end

  def deposit(amount)
    fail "Please make sure that deposit amount is positive integer" if amount < 0
    @balance += amount
    new_transaction = transaction.new(amount, DateTime.now)
    transactions.push(new_transaction)
  end

  def withdraw(amount)
    fail "Please make sure balance amount does not go below zero." if (balance - amount) < 0
    @balance -= amount
    new_transaction = transaction.new(-amount, DateTime.now)
    transactions.push(new_transaction)
  end

  private
  attr_reader :transaction

end
