class Apartment < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :rentals, dependent: :destroy
  has_many :markets, dependent: :destroy
  has_many :user_apartments, dependent: :destroy
end
