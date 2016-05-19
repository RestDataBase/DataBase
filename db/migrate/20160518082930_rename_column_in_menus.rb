class RenameColumnInMenus < ActiveRecord::Migration
  def change
  	change_table :menus do |t| 
  		t.rename :item_name, :name
  		t.rename :item_price, :price
  	end
  end
end
