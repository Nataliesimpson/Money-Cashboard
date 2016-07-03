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

end