class UserApartment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :apartment, foreign_key: 'apartment_id'
end
