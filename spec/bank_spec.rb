require 'bank'

describe Bank do
  let(:account) {double :account}
  let(:printer) {double :printer}
  let(:account_class) {double :account_class, :new => account}
  let(:bank) {Bank.new(:name => :tsb, :account_class => account_class, :printer => printer)}


  it "has a name" do
    expect(bank.name).to eql "tsb"
  end

  it "has an empty accounts list" do
    expect(bank.accounts).to be_empty
  end

  context "#create_account" do

    it "returns an account object" do
      my_account = bank.create_account(:name => :ash)
      expect(my_account).to eql(account)
    end

    it "adds accounts created to the existing list" do
      bank.create_account(:name => :ash)
      expect(bank.accounts).to include account
    end

  end

  context "#print_statement" do

    it "prints the bank statement of an account" do
      allow(printer).to receive(:print_statement)
      expect(printer).to receive(:print_statement).with(account)
      statement = bank.print_statement(account)
    end

  end

end
