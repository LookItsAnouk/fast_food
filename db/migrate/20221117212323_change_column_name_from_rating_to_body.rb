class ChangeColumnNameFromRatingToBody < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :rating
    add_column :reviews, :body, :text
  end
end
