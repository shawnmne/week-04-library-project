class Library < ActiveRecord::Base

	validates :branch_name, presence: true
	validates :address, presence: true
	validates :phone_number, presence: true
	validates :branch_name, uniqueness: true
	validates :address, uniqueness: true
	validates :phone_number, uniqueness: true
	validates_associated :staff_members
	validates_associated :books

	has_many :books
	has_many :staff_members

	def to_s
		branch_name
	end

end
