class Bank
  attr_reader :accounts

  def initialize(bank_details)
    @name = bank_details[:name]
    @account_class = bank_details[:account_class]
    @printer = bank_details[:printer]
    @accounts = []
  end

  def create_account(account_details)
    new_account = account_class.new(account_details)
    accounts.push(new_account)
    new_account
  end

  def name
    @name.to_s
  end

  def print_statement(account)
    fail "Sorry, we could not find your account in our bank" unless has_account?(account)
    printer.print_statement(account)
  end

  private
  attr_reader :account_class, :printer

  def has_account?(account)
    accounts.include?(account)
  end

end
