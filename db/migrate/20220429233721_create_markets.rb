class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
