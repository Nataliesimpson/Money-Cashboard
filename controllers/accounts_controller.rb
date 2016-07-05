require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/account.rb')

get '/account' do
@transactions = Transaction.all()
@tags = Tag.all()
@merchants = Merchant.all()
@account = Account.new({
    'transactions' => @transactions,
    'merchants' => @merchants,
    'tags' => @tags
    })
erb( :account )
end


