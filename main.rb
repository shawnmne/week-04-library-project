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
  erb :libraries_index
end	

# New
get '/libraries/new' do
  @library = Library.new
  erb :libraries_new
end

# Create
post '/libraries' do
  @library = Library.new(params)

  if @library.save
    redirect to('/libraries')
  else
    erb :libraries_new
  end
end

# Show
get '/libraries/:id' do
  @library = Library.find_by_id(params['id']) 
  erb :libraries_show
end


# Edit 
 get '/libraries/:id/edit' do
   @library = Library.find_by_id(params['id'])
   erb :libraries_edit
 end
 
 post '/libraries/:id' do
   @library = Library.find_by_id(params['id'])
   if @library.update_attributes(branch_name: params['branch_name'], 
                                phone_number: params['phone_number'],
                                address: params['address'])
     redirect to("/libraries/#{@library.id}")
   else
     erb :libraries_edit
   end
 	end

### books
get '/books' do 
  @books = Book.all
  erb :books_index
end	

# New
get '/books/new' do
  @book = Book.new
  erb :books_new
end

# Create
post '/books' do
  @book = Book.new(params)

  if @book.save
    redirect to('/books')
  else
    erb :books_new
  end
end

# Show
get '/books/:id' do
  @book = Book.find_by_id(params['id']) 
  erb :books_show
end


# Edit
 
 get '/books/:id/edit' do
   @book = Book.find_by_id(params['id'])
   @libraries = Library.all
   erb :books_edit
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
     erb :books_edit
   end
 	end 	


### patrons
get '/patrons' do 
  @patrons = Patron.all
  erb :patrons_index
end	

# New
get '/patrons/new' do
  @patron = Patron.new
  erb :patrons_new
end

# Create
post '/patrons' do
  @patron = Patron.new(params)

  if @patron.save
    redirect to('/patrons')
  else
    erb :patrons_new
  end
end

# Show
get '/patrons/:id' do
  @patron = Patron.find_by_id(params['id']) 
  erb :patrons_show
end


# Edit
 
 get '/patrons/:id/edit' do
   @patron = Patron.find_by_id(params['id'])
   erb :patrons_edit
 end
 
 post '/patrons/:id' do
   @patron = Patron.find_by_id(params['id'])
   if @patron.update_attributes(name: params['name'],
                                email: params['email'])
     redirect to("/patrons/#{@patron.id}")
   else
     erb :patrons_edit
   end
 	end 	

### staff_members
get '/staff_members' do 
  @staff_members = StaffMember.all
  erb :staff_members_index
end	

# New
get '/staff_members/new' do
  @staff_member = StaffMember.new
  erb :staff_members_new
end

# Create
post '/staff_members' do
  @staff_member = StaffMember.new(params)

  if @staff_member.save
    redirect to('/staff_members')
  else
    erb :staff_members_new
  end
end

# Show
get '/staff_members/:id' do
  @staff_member = StaffMember.find_by_id(params['id']) 
  erb :staff_members_show
end


# Edit
 
 get '/staff_members/:id/edit' do
   @staff_member = StaffMember.find_by_id(params['id'])
   erb :staff_members_edit
 end
 
 post '/staff_members/:id' do
   @staff_member = StaffMember.find_by_id(params['id'])
   if @staff_member.update_attributes(name: params['name'],
                                email: params['email'])
     redirect to("/staff_members/#{@staff_member.id}")
   else
     erb :staff_members_edit
   end
 	end 	


