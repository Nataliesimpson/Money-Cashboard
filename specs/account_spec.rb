require 'pry-byebug'

require('minitest/autorun')
require_relative('../models/account')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')

class TestAccount < Minitest::Test  

  def setup

    tag1 = Tag.new({'id' => 1, 'name' => 'Utilities'})
    tag2 = Tag.new({'id' => 2, 'name' => 'Petrol'})
    tag3 = Tag.new({'id' => 2, 'name' => 'Travel'})

    merchant1 = Merchant.new({'id' => 1, 'name' => 'Scottish Power'}),
    merchant2 = Merchant.new({'id' => 2, 'name' => 'Asda'}),
    merchant3 = Merchant.new({'id' => 3, 'name' => 'Lothian buses'})    

    transaction1 = Transaction.new({
      'id' => 1,
      'tag_id' => 1,
      'merchant_id' => 1,
      'transaction_name' => 'Electricity bill',
      'amount' => 70,
      'debit_credit' => 'debit'
    })
    transaction2 = Transaction.new({
      'id' => 2,
      'tag_id' => 2,
      'merchant_id' => 2,
      'transaction_name' => 'Weekly petrol',
      'amount' => 15,
      'debit_credit' => 'debit'
    })
    transaction3 = Transaction.new({
      'id' => 3,
      'tag_id' => 3,
      'merchant_id' => 3,
      'transaction_name' => 'Bus pass',
      'amount' => 55,
      'debit_credit' => 'debit'
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




end

