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
  @library = Library.find_by_id(params['id']) # nil or Insect object
  erb :libraries_show
end


# Edit
 
 get '/libraries/:id/edit' do
   @library = Library.find_by_id(params['id'])
 #  @researchers = Researcher.all
   erb :libraries_edit
 end
 
 post '/libraries/:id' do
   @library = Library.find_by_id(params['id'])
#   @researcher = Researcher.find_by_id(params['researcher_id'])
 binding.pry
   if @library.update_attributes(branch_name: params['branch_name'], 
                                phone_number: params['phone_number'],
                                address: params['address'])
                                #researcher: @researcher)
     redirect to("/libraries/#{@library.id}")
   else
     erb :libraries_edit
   end
 	end