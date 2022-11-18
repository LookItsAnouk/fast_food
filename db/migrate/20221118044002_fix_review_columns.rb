class FixReviewColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :pending?, :pending
    rename_column :reviews, :approved?, :approved
  end
end
