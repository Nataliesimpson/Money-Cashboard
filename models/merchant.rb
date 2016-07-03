require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')

class Merchant

binding.pry

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

end

