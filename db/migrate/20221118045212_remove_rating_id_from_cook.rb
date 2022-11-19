class RemoveRatingIdFromCook < ActiveRecord::Migration[7.0]
  def change
    remove_column :cooks, :ratings_id
  end
end
