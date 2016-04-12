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