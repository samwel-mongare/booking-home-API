class Apartment < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :markets, dependent: :destroy
  has_many :user_apartments, foreign_key: 'apartment_id',dependent: :destroy
  has_many :users, through: :user_apartments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true
  validates :image1, presence: true
  validates :rental, inclusion: { in: [true, false] }
  validates :favourite, inclusion: { in: [true, false] }

  def self.search(search)
    where('name ILIKE ? OR address ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
