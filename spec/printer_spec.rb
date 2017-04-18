require 'printer'

describe Printer do
  let(:transaction1) {double :transaction1, :amount => 10, :date => DateTime.new(2017,3,12), :balance => 10}
  let(:transaction2) {double :transaction2, :amount => -5, :date => DateTime.new(2017,4,15), :balance => 5}
  let(:transactions) {[transaction1, transaction2]}
  let(:printer) {Printer.new}
  let(:output) {"Date\t\t||Transaction Amount\t||Balance\t\n15/04/2017\t\t-5\t\t\t5\n12/03/2017\t\t10\t\t\t10\n_______________________________________________________\n"}

  it "prints the statement" do
    expect(printer.print_statement(transactions)).to eql output
  end

end
