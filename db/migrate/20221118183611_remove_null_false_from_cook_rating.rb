class RemoveNullFalseFromCookRating < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cooks, :rating
    add_reference :cooks, :rating, foreign_key: true
  end
end
