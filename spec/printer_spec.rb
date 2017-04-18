require 'printer'

describe Printer do
  let(:transaction1) {double :transaction1, :amount => 10, :date => DateTime.new(2017,3,12), :balance => 10}
  let(:transaction2) {double :transaction2, :amount => -5, :date => DateTime.new(2017,4,15), :balance => 5}
  let(:transactions) {[transaction1, transaction2]}
  let(:account) {double :account, :transactions => transactions}
  let(:printer) {Printer.new}
  let(:output) {"Date\t\t||Credit\t||Debit\t||Balance\t\n15/04/2017\t \t\t5\t5\n12/03/2017\t10\t\t \t10\n_______________________________________________________\n"}

  it "prints the statement" do
    expect(printer.print_statement(account)).to eql output
  end

end
