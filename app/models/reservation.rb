class Reservation < ActiveRecord::Base
  belongs_to :customer

  validates :customer, presence:true
  validates :date, presence:true
  validates :time, presence:true
  validates :party, presence:true
end
