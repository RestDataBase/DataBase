class ChangeOrderDetailOrders < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.change :order_detail, :text
  	end
  end
end
