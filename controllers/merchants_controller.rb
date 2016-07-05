require_relative '../models/merchant'

#new - gives us a form to fill out details of a new merchant
get '/merchants/new' do
  erb(:'merchants/new')
end

#create - create a new merchant and add it to our list
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to ( "merchants" )
end

#index - print out all our current merhchants
get '/merchants' do
  @merchants = Merchant.all
  erb :'merchants/index'
end

#show - gets one specific merchant that already exists from id
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  erb(:'merchants/show')
end

#edit - gives us a form to edit a merchants details
get '/merchants/:id/edit' do
end

#update - updates a specific merchant
post '/books/:id' do
end

#delete - deletes a specific merchant
delete '/books' do
end