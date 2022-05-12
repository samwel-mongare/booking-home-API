# frozen_string_literal: true

class AddMarketsRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :markets, null: false, foreign_key: true
  end
end