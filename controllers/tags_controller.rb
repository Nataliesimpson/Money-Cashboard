require_relative '../models/tag'

#new - gives us a form to fill out details of a new tag
get '/tags/new' do
  erb(:'tags/new')
end

#create - create a new tag and add it to our list
post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  erb :'tags/create'
end

#index - print out all our current tags
get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

#show - gets one specific tag that already exists from id
get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb(:'tag/show')
end

#edit - gives us a form to edit a tags details
get '/tags/:id/edit' do
end

#update - updates a specific tag
post '/tags/:id' do
end

#delete - deletes a specific tag
delete '/tags' do
end
