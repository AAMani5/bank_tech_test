require 'account'

describe Account do
  let(:account) {Account.new(:name => :ash)}

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
      expect{account.deposit(10)}.to change{account.balance}.by(10)
    end

  end

end
