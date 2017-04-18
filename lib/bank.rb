class Bank

  def initialize(bank_details)
    @name = bank_details[:name]
  end

  def create_account(account_details)
  end

  def name
    @name.to_s
  end

end
