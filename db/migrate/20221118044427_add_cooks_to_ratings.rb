class AddCooksToRatings < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :cooks, null: false, foreign_key: true
  end
end
