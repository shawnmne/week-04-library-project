require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"

get '/' do
	binding.pry
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
 binding.pry
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
   erb :books_edit
 end
 
 post '/books/:id' do
   @book = Book.find_by_id(params['id'])
   if @book.update_attributes(title: params['title'], 
                                author: params['author'],
                                isbn: params['isbn'])
     redirect to("/books/#{@book.id}")
   else
     erb :books_edit
   end
 	end 	




