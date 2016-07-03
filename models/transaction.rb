require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
require( 'date' )

class Transaction

  attr_reader( :id, :merchant_id, :tag_id, :transaction_name, :amount, :debit_credit, :date_time )

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @transaction_name = options['transaction_name']
    @amount = options['amount'].to_i
    @debit_credit = options[debit_credit]
    @date_time = DateTime.parse(options['date_time']).to_date
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, transaction_name, amount, debit_credit, date_time) VALUES ('#{ @merchant_id }', '#{ @tag_id }', '#{@transaction_name }', '#{@amount}', '#{@debit_credit}', '#{@date_time}') RETURNING *"
    transaction_data = run_sql(sql)
    @id = transaction_data.first['id'].to_i
  end



end  



