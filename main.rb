require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"
### front page
get '/' do
	erb :front_page
end

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



### books
get '/books' do 
  @books = Book.all
  erb :"books/index"
end	

# New
get '/books/new' do
  @book = Book.new
  @libraries = Library.all
  erb :"books/new"
end

# Create
post '/books' do
  @book = Book.new(params)

  if @book.save
    redirect to('/books')
  else
    erb :"books/new"
  end
end

# Show
get '/books/:id' do
  @book = Book.find_by_id(params['id']) 
  erb :"books/show"
end

#check out books
	get '/books/:id/checkout' do 
 		@book = Book.find_by_id(params['id']) 
 		@patrons = Patron.all
 		erb :"books/checkout"
 	end

  post '/books/:id/checkout' do
  @book = Book.find_by_id(params['id'])
  @patron = Patron.find_by_id(params['patron_id'])
  if @book.update_attributes(patron: @patron)                        
    redirect to("/books/#{@book.id}")
  else
    erb :"books/edit"
  end
end

#check in books
	get '/books/:id/checkin' do 
 		@book = Book.find_by_id(params['id']) 
 		@book.update_attributes(patron_id: nil)
 		erb :"books/show"
 	end



# Edit
 
 get '/books/:id/edit' do
   @book = Book.find_by_id(params['id'])
   @libraries = Library.all
   erb :"books/edit"
 end
 
 post '/books/:id' do
   @book = Book.find_by_id(params['id'])
   @library = Library.find_by_id(params['library_id'])
   if @book.update_attributes(title: params['title'], 
                                author: params['author'],
                                isbn: params['isbn'],
                                library: @library)
     redirect to("/books/#{@book.id}")
   else
     erb :"books/edit"
   end
 	end 	


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

### staff_members
get '/staff_members' do 
  @staff_members = StaffMember.all
  erb :"staff_members/index"
end	

# New
get '/staff_members/new' do
  @staff_member = StaffMember.new
  @libraries = Library.all
  erb :"staff_members/new"
end

# Create
post '/staff_members' do
  @staff_member = StaffMember.new(params)

  if @staff_member.save
    redirect to('/staff_members')
  else
    erb :"staff_members/new"
  end
end

# Show
get '/staff_members/:id' do
  @staff_member = StaffMember.find_by_id(params['id']) 
  erb :"staff_members/show"
end


# Edit
 
 get '/staff_members/:id/edit' do
   @staff_member = StaffMember.find_by_id(params['id'])
   @libraries = Library.all
   erb :"staff_members/edit"
 end
 
 post '/staff_members/:id' do
   @staff_member = StaffMember.find_by_id(params['id'])
   @library = Library.find_by_id(params['library_id'])
   if @staff_member.update_attributes(name: params['name'],
                                email: params['email'],
                                library: @library)
     redirect to("/staff_members/#{@staff_member.id}")
   else
     erb :"staff_members/edit"
   end
 	end 	


