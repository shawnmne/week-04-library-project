class Patron < ActiveRecord::Base

	validates :name, presence: true
	validates :email_address, presence: true
	validates :email_address, uniqueness: true
	validates_associated :books

	has_many :books
end
