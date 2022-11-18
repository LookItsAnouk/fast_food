class UpdateRatingIdInCooks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cooks, :ratings
    add_reference :cooks, :rating, null: false, foreign_key: true
  end
end
