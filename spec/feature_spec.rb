require_relative '../lib/bank'
require_relative '../lib/account'
require_relative '../lib/printer'

lloyds_bank = Bank.new(:name => :lloyds, :account_class => Account, :printer => Printer.new)

my_account = lloyds_bank.create_account(:name => :my)

my_account.deposit(:amount => 1000, :date =>'10/01/2012')
my_account.deposit(:amount => 2000, :date =>'13/01/2012')
my_account.withdraw(:amount => 500, :date =>'14/01/2012')

puts lloyds_bank.print_statement(my_account)
