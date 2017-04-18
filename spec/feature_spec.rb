require_relative '../lib/bank'
require_relative '../lib/account'
require_relative '../lib/printer'

lloyds_bank = Bank.new(:name => :lloyds, :account_class => Account, :printer => Printer.new)

my_account = lloyds_bank.create_account(:name => :my)

my_account.deposit(1000)
my_account.deposit(2000)
my_account.withdraw(500)

puts lloyds_bank.print_statement(my_account)
