class RemoveQuantitySelectFromMenu < ActiveRecord::Migration
  def change
  	change_table :menus do |t| 
  		t.remove :item_quantity
  		t.remove :item_select
  	end
  end
end
