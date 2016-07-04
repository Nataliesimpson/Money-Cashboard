require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')

class Merchant

  attr_reader :id, :merchant_name   

  def initialize( options )
    @id = options['id'].to_i
    @merchant_name = options['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants (merchant_name) VALUES ('#{@merchant_name}') RETURNING *"
    merchant_data = run_sql(sql).first
    result = Merchant.new(merchant_data)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    run_sql(sql)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    return Merchant.map_items(sql)
  end

  def self.map_items( sql )
    merchants = run(sql)
    result = merchants.map { |merchant| Book.new( merchant ) }
    return result
  end

  def self.map_item( sql )
    result = Merchant.map_items(sql)
    return result.first
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_item( sql )
  end 

  def transactions()
    sql = "SELECT * FROM transactions WHERE merchant_id = #{@id}"
    return Member.map_items( sql )
  end
  

end

