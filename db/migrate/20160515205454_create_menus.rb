class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :item_name
      t.integer :item_quantity
      t.float :item_price
      t.boolean :item_select

      t.timestamps null: false
    end
  end
end
