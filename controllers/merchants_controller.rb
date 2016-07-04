require_relative '../models/merchant'

get '/merchants' do
  @merchants = Merchant.all
  erb :'merchants/index'
end

# get '/vendors/new' do
#   erb :'vendors/new'
# end

# post '/vendors' do
#   Vendor.create(params)
#   redirect to('/vendors')
# end
