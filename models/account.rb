require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
require_relative( 'transaction')

class Account

  attr_reader( :transaction )

  def initialize(transactions)
      # @transactions = params[:transactions]
      @transactions = transactions
    end

  # def balance
  #   balance = 0
  #   @transactions.each do |transaction| 
  #     if transaction.debit_credit == "Credit"
  #     balance += transaction.amount
  #     elsif transaction.debit_credit == "Debit"
  #     balance -= transaction.amount
  #     end 
  #   end
  #   return balance
  # end  


end  