class AddFavouriteToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :favourite, :boolean
  end
end
