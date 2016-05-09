class Order < ActiveRecord::Base
  belongs_to :customer

  validates :customer, presence:true
  validates :order_detail, presence:true
end
