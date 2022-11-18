class AddingCookReferenceToRatings < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :cook, null: false, foreign_key: true
  end
end
