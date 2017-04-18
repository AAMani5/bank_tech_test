class Printer

  def print_statement(account)
    sorted_transactions = account.transactions.sort{|a,b| b.date <=> a.date}
    print_header + sorted_transactions.map{|transaction| print_transaction(transaction)}.join("\n") + print_footer
  end

  private

  def print_header
    "Date\t\t||Transaction Amount\t||Balance\t\n"
  end

  def print_transaction(transaction)
    "#{transaction.date.strftime('%d/%m/%Y')}\t\t" +
    "#{transaction.amount}\t\t\t" +
    "#{transaction.balance}"
  end

  def print_footer
    "\n" + "_" * 55 + "\n"
  end

end
