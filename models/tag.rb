require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')

class Tag

  attr_reader( :id, :tag_name )

  def initialize( options )
    @id = options['id'].to_i
    @tag_name = options['tag_name']
  end

  def save()
    sql = "INSERT INTO tags (tag_name) VALUES ('#{@tag_name}') RETURNING *"
    tag_data = run_sql(sql).first
    result = Tag.new(tag_data)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    run_sql(sql)
  end

  # def self.all()
  #   sql = "SELECT * FROM merchants"
  #   return Merchant.map_items(sql)
  # end

  # def self.map_items( sql )
  #   merchant = run(sql)
  #   result = merchant.map { |merchant| Book.new( merchant ) }
  #   return result
  # end

  # def self.map_item( sql )
  #   result = Merchant.map_items(sql)
  #   return result.first
  # end

  # def self.find(id)
  #   sql = "SELECT * FROM merchants WHERE id = #{id}"
  #   return Merchant.map_item( sql )
  # end 

  # def transactions()
  #   sql = "SELECT * FROM transactions WHERE merchant_id = #{@id}"
  #   return Member.map_items( sql )
  # end

end