require_relative '../models/merchant'

#new
get '/merchants/new' do

end

#create

#index
get '/merchants' do
  @merchants = Merchant.all
  erb :'merchants/index'
end

#show
get '/merchants/:id' do

end
#edit

#update

#delete