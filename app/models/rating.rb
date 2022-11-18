class Rating < ApplicationRecord

  # Associations

  belongs_to :user
  belongs_to :cook

  

  # Validations

  validates(
    :cook_id,
    uniqueness: {
      scope: :user_id,
      message: "Has already been rated"
      }
    )
  
end
