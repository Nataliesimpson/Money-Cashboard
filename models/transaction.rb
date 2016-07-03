require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
require_relative( 'tag')
require_relative( 'merchant')

class Transaction

  attr_reader( :id, :merchant_id, :tag_id, :transaction_name, :amount, :debit_credit )

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @transaction_name = options['transaction_name']
    @amount = options['amount'].to_i
    @debit_credit = options['debit_credit']
    # @date_time = DateTime.parse(options['date_time']).to_date
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, transaction_name, amount, debit_credit) VALUES ('#{ @merchant_id }', '#{ @tag_id }', '#{@transaction_name }', '#{@amount}', '#{@debit_credit}') RETURNING *"
    tag_data = run_sql(sql).first
    result = Tag.new(tag_data)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    run_sql(sql)
  end





end  



