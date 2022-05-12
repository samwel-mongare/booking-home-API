# frozen_string_literal: true

class AddUserRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user_apartments, null: false, foreign_key: true
  end
end