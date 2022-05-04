class CreateUserApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_apartments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
