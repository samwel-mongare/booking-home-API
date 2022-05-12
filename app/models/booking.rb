class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :user_apartment
end