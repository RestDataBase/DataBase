class Customer < ActiveRecord::Base
	has_many :orders
	has_many :reservations

	validates :fname, presence: true
	validates :lname, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :phone, presence: true

	def fullName
		"#{fname} #{lname}"
	end
end
