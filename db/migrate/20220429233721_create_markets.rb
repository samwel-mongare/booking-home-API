class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.integer :price
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
