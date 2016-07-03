require( 'pry-byebug' )

require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )

Merchant.delete_all()
Tag.delete_all()
Transaction.delete_all()

merchant1 = Merchant.new({ 'merchant_name' => 'Real Foods'}).save()
merchant2 = Merchant.new({ 'merchant_name' => 'H&M'}).save()
merchant3 = Merchant.new({ 'merchant_name' => 'Virgin Trains'}).save
merchant4 = Merchant.new({ 'merchant_name' => 'Bodega'}).save
merchant5 = Merchant.new({ 'merchant_name' => 'Workplace'}).save

tag1 = Tag.new({ 'tag_name' => 'Groceries' }).save()
tag2 = Tag.new({ 'tag_name' => 'Clothing' }).save()
tag3 = Tag.new({ 'tag_name' => 'Travel' }).save()
tag4 = Tag.new({ 'tag_name' => 'Restaurants' }).save()
tag5 = Tag.new({ 'tag_name' => 'Salary' }).save()

transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'transaction_name' => 'Weekly shop', 'amount' => 100, 'debit_credit' => 'debit'}).save
transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'transaction_name' => 'New shoes', 'amount' => 100, 'debit_credit' => 'debit'}).save
transaction3 = Transaction.new({'merchant_id' => merchant3.id, 'tag_id' => tag3.id, 'transaction_name' => 'Train to London', 'amount' => 75, 'debit_credit' => 'debit'}).save
transaction4 = Transaction.new({'merchant_id' => merchant4.id, 'tag_id' => tag4.id, 'transaction_name' => 'Friday Dinner', 'amount' => 40, 'debit_credit' => 'debit'}).save
transaction4 = Transaction.new({'merchant_id' => merchant5.id, 'tag_id' => tag5.id, 'transaction_name' => 'June Salary', 'amount' => 1000, 'debit_credit' => 'credit'}).save


binding.pry
nil