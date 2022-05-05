class Rental < ApplicationRecord
  belongs_to :apartment, foreign_key: 'apartment_id'

  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :period, numericality: { greater_than: 0 }, presence: true
end
