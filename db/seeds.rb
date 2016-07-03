require( 'pry-byebug' )

require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )

Merchant.delete_all()
Tag.delete_all()

merchant1 = Merchant.new({ 'merchant_name' => 'Real Foods'}).save()
merchant2 = Merchant.new({ 'merchant_name' => 'H&M'}).save()

tag1 = Tag.new({ 'tag_name' => 'food' }).save()


binding.pry
nil