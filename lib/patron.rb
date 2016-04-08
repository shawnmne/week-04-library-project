class Patron < ActiveRecord::Base

	validates :name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates_associated :books

	has_many :books
end
