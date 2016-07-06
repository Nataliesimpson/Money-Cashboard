require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
require_relative( 'tag' )
require_relative( 'merchant' )
require_relative( 'transaction' )

class Account

  attr_reader :tags, :merchants, :transactions

  def initialize(params)
    @tags = params['tags']
    @merchants = params['merchants']
    @transactions = params['transactions']
  end

  #functions
  def all_transaction_amounts
    transaction_array = @transactions.map { |transaction| transaction.amount }
    return transaction_array
  end

  def most_expensive_transaction_amount
    return all_transaction_amounts.max
  end

  def least_expensive_transaction_amount
    return all_transaction_amounts.min
  end

  def total_expenditure
    total = 0

    @transactions.each {|transaction| total += transaction.amount}
    return total
  end

  def total_balance
    balance = 0

    for transaction in @transactions

      if transaction.debit_credit == 'credit'
      balance += transaction.amount
      elsif transaction.debit_credit == 'debit'
      balance -= transaction.amount
      end 
    end
    return balance
  end  

  def total_number_transactions
    total_number = @transactions.map
    return total_number.count
  end  

  def total_income
    balance = 0

    for transaction in @transactions

    if transaction.debit_credit == 'credit'
    balance += transaction.amount
    end
    end
      return balance
  end  

  def total_expenses
    balance = 0

    for transaction in @transactions

    if transaction.debit_credit == 'debit'
    balance += transaction.amount
    end
    end
      return balance
  end  

  def total_expenditure_by_tag(tag_id)
     total = 0
     @transactions.each do |transaction|
     total += transaction.amount if transaction.tag_id == tag_id
   end
   return total
  end


end




