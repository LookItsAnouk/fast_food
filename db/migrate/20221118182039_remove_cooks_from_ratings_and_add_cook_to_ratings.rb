class RemoveCooksFromRatingsAndAddCookToRatings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :ratings, :cooks
    add_reference :ratings, :cook, null: false, foreign_key: true
   
  end
end
