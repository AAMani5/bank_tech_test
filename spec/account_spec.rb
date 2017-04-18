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
      expect{account.deposit(:amount => deposit_amount)}.to change(account, :balance).by(deposit_amount)
    end

    it "adds a transaction to existing list" do
      expect{account.deposit(:amount => deposit_amount)}.to change(account.transactions, :count).by(1)
    end

    it "raises an error if negative amount deposited" do
      expect{account.deposit(:amount => -1)}.to raise_error "Please make sure that deposit amount is positive integer"
      expect(account.balance).to eql 0
    end

  end

  context "withdraw" do

    before (:each) {account.deposit(:amount => deposit_amount)}

    it "decreases the balance amount" do
      expect{account.withdraw(:amount => withdraw_amount)}.to change(account, :balance).by(-withdraw_amount)
    end

    it "adds a transaction to existing list" do
      expect{account.withdraw(:amount => withdraw_amount)}.to change(account.transactions, :count).by(1)
    end

    it "raises an error if the resulting balance becomes negative" do
      expect{account.withdraw(:amount => 11)}.to raise_error "Please make sure balance amount does not go below zero."
      expect(account.balance).to eql deposit_amount
    end

  end

end
