class User < ApplicationRecord
  has_secure_password

  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_many :ratings, dependent: :destroy
  has_many :rated_cooks, through: :ratings, source: :cook, dependent: :destroy

  



  
end