class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.integer :price, default: 0
      t.integer :period, default: 0
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
