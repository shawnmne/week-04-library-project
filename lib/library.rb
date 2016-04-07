class Library < ActiveRecord::Base

	validates :branch_name, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :branch_name, uniqueness: true
	validates :address, uniqueness: true
	validates :phone, uniqueness: true
	validates_associated :staff_members
	validates_associated :books

	has_many :books
	has_many :staff_members
end
