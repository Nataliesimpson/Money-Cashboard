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

  def self.all()
    sql = "SELECT * FROM tags"
    return Tag.map_items(sql)
  end

  def self.map_items( sql )
    tags = run_sql(sql)
    result = tags.map { |tag| Tag.new( tag ) }
    return result
  end

  def self.map_item( sql )
    result = Tag.map_items(sql)
    return result.first
  end

 def self.find(id)
   sql = "SELECT * FROM tags WHERE id = #{id}"
   return Tag.map_item( sql )
 end 

 def transactions()
   sql = "SELECT * FROM transactions WHERE tag_id = #{@id}"
   return Tag.map_items( sql )
 end




end






