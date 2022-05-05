class AddRentalPriceHousePricePeriodToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :rental_price, :integer, default: 0
    add_column :apartments, :house_price, :integer, default: 0
    add_column :apartments, :period, :integer, default: 0
  end
end
