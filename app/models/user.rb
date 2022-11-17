class User < ApplicationRecord

  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :orders, dependent: :destroy
  
end