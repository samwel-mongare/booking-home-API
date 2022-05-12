# frozen_string_literal: true

class AddRentalsRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :rentals, null: false, foreign_key: true
  end
end