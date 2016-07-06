require_relative '../models/transaction'



# GET route for the 'new' form
#new - gives us a form to fill out details of a new transaction
get '/transactions/new' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:'transactions/new')
end

# POST route to 'create' an order
#create - create a new transaction and add it to our list
post '/transactions' do
  #creates transaction object
  @transaction = Transaction.new(params)
  #saves this object to db
  @transaction.save
  # redirect to 'transactions'
  erb :'transactions/create'
end

# GET route for all/'index' the orders
#index - display all our current transactions
get '/transactions' do
  #get all of our transactions
  @transactions = Transaction.all()
  #populate the data in erb and send to client
  erb :'transactions/index'
end

#show - gets one specific transaction that already exists from id
get '/transactions/:id' do
  #find transaction with specified id
  @transaction = Transaction.find(params['id'])
  erb(:'transaction/show')
end

#edit - gives us a form to edit a transactions details
get '/transactions/:id/edit' do
end

#update - updates a specific transaction
post '/transactions/:id' do
end

#delete - deletes a specific transaction
delete '/transactions/:id' do
Transaction.delete_All(params[:id])
  redirect to ('/transactions')
end