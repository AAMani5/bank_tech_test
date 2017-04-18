require 'bank'

describe Bank do

  let(:bank) {Bank.new(:name => :tsb)}
  let(:account) {double :account}

  it "has a name" do
    expect(bank.name).to eql "tsb"
  end

  context "#create_account" do
    it "takes account details as parameter" do
      expect{bank.create_account(:name => :ash)}.not_to raise_error
    end

    it "returns an account object" do
      allow(bank).to receive(:create_account).and_return(account)
      my_account = bank.create_account(:name => :ash)
      expect(my_account).to eql(account)
    end

  end

end
