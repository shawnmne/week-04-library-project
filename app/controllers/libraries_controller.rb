### libraries
get '/libraries' do 
  @libraries = Library.all
  erb :"libraries/index"
end	

# New
get '/libraries/new' do
  @library = Library.new
  erb :"libraries/new"
end

# Create
post '/libraries' do
  @library = Library.new(params)

  if @library.save
    redirect to('/libraries')
  else
    erb :"libraries/new"
  end
end



# Show
get '/libraries/:id' do
  @library = Library.find_by_id(params['id']) 
  erb :"libraries/show"
end


#show all books at library
	get '/libraries/:id/books' do 
 		@library = Library.find_by_id(params['id']) 
 		@books = Book.all
 		erb :"libraries/show_books"
 	end

#show all staff members at library
  get '/libraries/:id/staff' do 
    @library = Library.find_by_id(params['id']) 
    @staff_members = StaffMember.all
    erb :"libraries/show_staff"
  end

# Edit 
 get '/libraries/:id/edit' do
   @library = Library.find_by_id(params['id'])
   erb :"libraries/edit"
 end
 
 post '/libraries/:id' do
   @library = Library.find_by_id(params['id'])
   if @library.update_attributes(branch_name: params['branch_name'], 
                                phone_number: params['phone_number'],
                                address: params['address'])
     redirect to("/libraries/#{@library.id}")
   else
     erb :"libraries/edit"
   end
 	end