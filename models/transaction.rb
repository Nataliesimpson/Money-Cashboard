require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')
require_relative( 'tag')
require_relative( 'merchant')

class Transaction

  attr_reader( :id, :merchant_id, :tag_id, :transaction_name, :amount, :debit_credit, :transaction_date, :transaction_time )

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['merchant_id'].to_i
    @transaction_name = options['transaction_name']
    @amount = options['amount'].to_i
    @debit_credit = options['debit_credit']
    @transaction_date = options['transaction_date']
    @transaction_time = options['transaction_time']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, transaction_name, amount, debit_credit, transaction_date, transaction_time) VALUES ('#{ @merchant_id }', '#{ @tag_id }', '#{@transaction_name }', '#{@amount}', '#{@debit_credit}', '#{@transaction_date}', '#{@transaction_time}') RETURNING *"
    transaction_data = run_sql(sql).first
    result = Transaction.new(transaction_data)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    run_sql(sql)
  end

  # def self.all()
  #   sql = "SELECT * FROM transactions"
  #   return Transaction.map_items(sql)
  # end

  def self.all(query = "", query_type = "")
     query = query.to_s
     query_type = query_type.to_s
     sql = "SELECT * FROM transactions"
     sql = sql + " WHERE tag_id = #{query}" if query != "" && query_type == "tag"
     return Transaction.map_items(sql)
   end

  def self.map_items( sql )
    transactions = run_sql(sql)
    result = transactions.map { |transaction| Transaction.new( transaction ) }
    return result
  end

  def self.map_item( sql )
    result = Transaction.map_items(sql)
    return result.first
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return Transaction.map_item( sql )
  end 

  def find_merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    return Merchant.map_item(sql)
  end

  def find_tag()
    sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
    return Tag.map_item(sql)
  end

  def merchant_name()
    sql = "SELECT merchant_name FROM merchants WHERE id = #{@merchant_id}"
    return Merchant.map_item(sql).merchant_name
  end  

  def tag_name()
    sql = "SELECT tag_name FROM tags WHERE id = #{@tag_id}"
    return Tag.map_item(sql).tag_name
  end




end  



