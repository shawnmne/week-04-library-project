### patrons
get '/patrons' do 
  @patrons = Patron.all
  erb :"patrons/index"
end	

# New
get '/patrons/new' do
  @patron = Patron.new
  erb :"patrons/new"
end

# Create
post '/patrons' do
  @patron = Patron.new(params)

  if @patron.save
    redirect to('/patrons')
  else
    erb :"patrons/new"
  end
end

# Show
get '/patrons/:id' do
  @patron = Patron.find_by_id(params['id']) 
  erb :"patrons/show"
end


# Edit
 
 get '/patrons/:id/edit' do
   @patron = Patron.find_by_id(params['id'])
   erb :"patrons/edit"
 end
 
 post '/patrons/:id' do
   @patron = Patron.find_by_id(params['id'])
   if @patron.update_attributes(name: params['name'],
                                email: params['email'])
     redirect to("/patrons/#{@patron.id}")
   else
     erb :"patrons/edit"
   end
 	end 	