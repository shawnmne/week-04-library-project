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