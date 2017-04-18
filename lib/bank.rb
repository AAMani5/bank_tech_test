class Bank
  attr_reader :accounts

  def initialize(bank_details)
    @name = bank_details[:name]
    @account_class = bank_details[:account_class]
    @accounts = []
  end

  def create_account(account_details)
    new_account = account_class.new(account_details[:name])
    accounts.push(new_account)
    new_account
  end

  def name
    @name.to_s
  end

  private
  attr_reader :account_class

end
