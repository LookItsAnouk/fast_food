class Cook < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user
end
