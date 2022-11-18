class AddRatingsToCooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :cooks, :ratings, null: false, foreign_key: true
  end
end
