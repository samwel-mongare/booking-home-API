class User < ApplicationRecord
  has_secure_password
  has_many :user_apartments, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
