class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :location
      t.text :description
      t.boolean :rental, default: false
      t.text :image1
      t.text :image2
      t.text :image3
      t.references :user, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
