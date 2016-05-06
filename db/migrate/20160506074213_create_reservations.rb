class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :customer, index: true, foreign_key: true
      t.date :date
      t.time :time
      t.integer :party
      t.text :request

      t.timestamps null: false
    end
  end
end
