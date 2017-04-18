require 'date'

class Account
  attr_reader :balance, :transactions

  def initialize(accout_details)
    @name = accout_details[:name]
    @balance = 0
    @transactions = []
    @transaction_class = accout_details[:transaction_class] || Struct.new(:amount, :date, :balance)
  end

  def name
    @name.to_s
  end

  def deposit(amount_details)
    amount = amount_details[:amount]
    fail "Please make sure the deposit amount is an integer" if not_integer? amount
    fail "Please make sure that deposit amount is positive integer" if negative_amount? amount
    @balance += amount
    date = get_date(amount_details[:date])
    new_transaction = transaction_class.new(amount, date, @balance)
    transactions.push(new_transaction)
  end

  def withdraw(amount_details)
    amount = amount_details[:amount]
    fail "Please make sure the amount to withdraw is an integer" if not_integer? amount
    fail "Please make sure that amount to withdraw is positive integer" if negative_amount? amount
    fail "Please make sure balance amount does not go below zero." if balance_negative? amount
    @balance -= amount
    date = get_date(amount_details[:date])
    new_transaction = transaction_class.new(-amount, date, @balance)
    transactions.push(new_transaction)
  end

  private
  attr_reader :transaction_class

  def balance_negative?(amount)
    balance - amount < 0
  end

  def not_integer?(amount)
    !amount.respond_to?(:even?)
  end

  def negative_amount?(amount)
    amount < 0
  end

  def get_date(date)
    date ? DateTime.parse(date) : DateTime.now
  end

end
