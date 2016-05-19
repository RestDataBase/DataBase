class AddItemIdToOrder < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.references :item, index: true, foreign_key: true
    end
  end
end
