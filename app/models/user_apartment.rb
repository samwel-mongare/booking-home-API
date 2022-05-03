class UserApartment < ApplicationRecord
  belongs_to :user
  belongs_to :apartment

  validates :user_id, presence: true
  validates :apartment_id, presence: true
end
