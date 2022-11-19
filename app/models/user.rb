class User < ApplicationRecord
  has_secure_password

  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  # User making a rating
  has_many :ratings, dependent: :destroy

  

  
end