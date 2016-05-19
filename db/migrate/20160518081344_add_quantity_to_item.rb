class AddQuantityToItem < ActiveRecord::Migration
  def change
  	change_table :items do |t|
  		t.integer :quantity
  	end
  end
end
