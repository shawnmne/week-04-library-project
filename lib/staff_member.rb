class StaffMember < ActiveRecord::Base

	validates :name, presence: true
	validates :email_address, presence: true
	validates :library_id, presence: true
	validates :email_address, uniqueness: true

	belongs_to :library	
end
