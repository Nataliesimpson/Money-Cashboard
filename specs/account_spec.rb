require 'pry-byebug'

require('minitest/autorun')
require_relative('../models/account')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')

class TestAccount < Minitest::Test  

  def setup

    tag1 = Tag.new({'id' => 1, 'tag_name' => 'Utilities'})
    tag2 = Tag.new({'id' => 2, 'tag_name' => 'Petrol'})
    tag3 = Tag.new({'id' => 2, 'tag_name' => 'Travel'})

    merchant1 = Merchant.new({'id' => 1, 'merchant_name' => 'Scottish Power'}),
    merchant2 = Merchant.new({'id' => 2, 'merchant_name' => 'Asda'}),
    merchant3 = Merchant.new({'id' => 3, 'merchant_name' => 'Lothian buses'})    

    transaction1 = Transaction.new({
      'id' => 1,
      'tag_id' => 1,
      'merchant_id' => 1,
      'transaction_name' => 'Electricity bill',
      'amount' => 70,
      'debit_credit' => 'debit',
      'transaction_date' => '2016-06-30',
      'transaction_time' => '12:30'
    })
    transaction2 = Transaction.new({
      'id' => 2,
      'tag_id' => 2,
      'merchant_id' => 2,
      'transaction_name' => 'Weekly petrol',
      'amount' => 15,
      'debit_credit' => 'debit',
      'transaction_date' => '2016-07-01',
      'transaction_time' => '12:49'
    })
    transaction3 = Transaction.new({
      'id' => 3,
      'tag_id' => 3,
      'merchant_id' => 3,
      'transaction_name' => 'Bus pass',
      'amount' => 55,
      'debit_credit' => 'debit',
      'transcation_date' => '2016-07-02',
      'transaction_time' => '13:03'
    })
     
    @tags = [tag1, tag2, tag3]
    @merchants = [merchant1, merchant2, merchant3]
    @transactions = [transaction1, transaction2, transaction3]

    accounts = {
      'tags' => @tags,
      'merchants' => @merchants,
      'transactions' => @transactions
     }

    @account = Account.new(accounts)
  end

  #tests
  def test_all_transaction_amounts
    result = @account.all_transaction_amounts
    expectation = [70, 15, 55]
    assert_equal(expectation, result)
  end

  def test_most_expensive_transaction_amount
    result = @account.most_expensive_transaction_amount
    assert_equal(70, result)
  end

  def test_least_expensive_transaction
    result = @account.least_expensive_transaction_amount
    assert_equal(15, result)
  end

  def test_total_expenditure
    result = @account.total_expenditure
    assert_equal(140, result)
  end 

  def test_total_balance
    result = @account.total_balance
    assert_equal(-140, result)
  end  

  def test_total_number_transactions
    result = @account.total_number_transactions
    assert_equal(3, result)
  end  

  def test_total_income
    result = @account.total_income
    assert_equal(0, result)
  end  

  def test_total_expenses
    result = @account.total_expenses
    assert_equal(140, result)
  end 

 # def test_all_tags_names
 #   result = @account.all_tag_names
 #   expectation = ['Utilities', 'Petrol', 'Travel']
 #   assert_equal(expectation, result)
 # end

 # def test_aamount_by_tag
 #   result = @account.amount_by_tag
 #   expectation = [70, 15, 55]
 #   assert_equal(expectation, result)
 # end


end

