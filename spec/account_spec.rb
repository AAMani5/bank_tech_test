require 'account'

describe Account do
  let(:account) {Account.new(:name => :ash)}
  let(:deposit_amount) {10}
  let(:withdraw_amount) {5}

  it "has a name" do
    expect(account.name).to eql 'ash'
  end

  it "has a initial balance of zero" do
    expect(account.balance).to eql 0
  end

  it "has empty transactions list" do
    expect(account.transactions).to be_empty
  end

  context "#deposit" do

    it "increases the balance amount" do
      expect{account.deposit(deposit_amount)}.to change(account, :balance).by(deposit_amount)
    end

    it "adds a transaction to existing list" do
      expect{account.deposit(deposit_amount)}.to change(account.transactions, :count).by(1)
    end

  end

  context "withdraw" do

    before (:each) {account.deposit(deposit_amount)}

    it "decreases the balance amount" do
      expect{account.withdraw(withdraw_amount)}.to change(account, :balance).by(-withdraw_amount)
    end

    it "adds a transaction to existing list" do
      expect{account.withdraw(withdraw_amount)}.to change(account.transactions, :count).by(1)
    end

  end

end
