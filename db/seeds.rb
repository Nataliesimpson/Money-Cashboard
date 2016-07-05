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
merchant6 = Merchant.new({ 'merchant_name' => 'Apple'}).save
merchant7 = Merchant.new({ 'merchant_name' => 'Santander'}).save
merchant8 = Merchant.new({ 'merchant_name' => 'Expedia'}).save

tag1 = Tag.new({ 'tag_name' => 'Groceries' }).save()
tag2 = Tag.new({ 'tag_name' => 'Clothing' }).save()
tag3 = Tag.new({ 'tag_name' => 'Travel' }).save()
tag4 = Tag.new({ 'tag_name' => 'Restaurants' }).save()
tag5 = Tag.new({ 'tag_name' => 'Salary' }).save()
tag6 = Tag.new({ 'tag_name' => 'General' }).save()
tag7 = Tag.new({ 'tag_name' => 'Transfers' }).save()
tag8 = Tag.new({ 'tag_name' => 'Holiday' }).save()

transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'transaction_name' => 'Weekly shop', 'amount' => 100, 'debit_credit' => 'debit', 'transaction_date' => '2016-06-30', 'transaction_time' => '12:00'}).save

transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'transaction_name' => 'New shoes', 'amount' => 100, 'debit_credit' => 'debit', 'transaction_date' => '2016-07-01', 'transaction_time' => '12:49'}).save

transaction3 = Transaction.new({'merchant_id' => merchant3.id, 'tag_id' => tag3.id, 'transaction_name' => 'Train to London', 'amount' => 75, 'debit_credit' => 'debit', 'transaction_date' => '2016-07-02', 'transaction_time' => '12:31'}).save

transaction4 = Transaction.new({'merchant_id' => merchant4.id, 'tag_id' => tag4.id, 'transaction_name' => 'Friday Dinner', 'amount' => 40, 'debit_credit' => 'debit', 'transaction_date' => '2016-06-30', 'transaction_time' => '22:16'}).save

transaction5 = Transaction.new({'merchant_id' => merchant5.id, 'tag_id' => tag5.id, 'transaction_name' => 'June Salary', 'amount' => 1000, 'debit_credit' => 'credit', 'transaction_date' => '2016-07-03', 'transaction_time' => '09:00'}).save

transaction6 = Transaction.new({'merchant_id' => merchant6.id, 'tag_id' => tag6.id, 'transaction_name' => 'New laptop', 'amount' => 500, 'debit_credit' => 'debit', 'transaction_date' => '2016-07-05', 'transaction_time' => '09:46'}).save

transaction7 = Transaction.new({'merchant_id' => merchant7.id, 'tag_id' => tag7.id, 'transaction_name' => 'Transfer from savings account', 'amount' => 250, 'debit_credit' => 'credit', 'transaction_date' => '2016-07-05', 'transaction_time' => '11:56'}).save

transaction8 = Transaction.new({'merchant_id' => merchant8.id, 'tag_id' => tag8.id, 'transaction_name' => 'Summer holiday to Italy', 'amount' => 500, 'debit_credit' => 'debit', 'transaction_date' => '2016-07-06', 'transaction_time' => '14:26'}).save


binding.pry
nil