class Customer < ActiveRecord::Base

	validates :fname, presence: true
	validates :lname, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :phone, presence: true

end
