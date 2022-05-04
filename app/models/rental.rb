class Rental < ApplicationRecord
  belongs_to :apartment

  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :period, numericality: { greater_than: 0 }, presence: true
end
