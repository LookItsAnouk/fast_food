class Recipe < ApplicationRecord

    has_many :reviews, dependent: :destroy
    has_many :orders, dependent: :destroy

    belongs_to :user

end
