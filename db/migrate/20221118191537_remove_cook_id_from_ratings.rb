class RemoveCookIdFromRatings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :ratings, :cook
  end
end
