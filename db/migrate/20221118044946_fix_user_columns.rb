class FixUserColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :is_cook?, :is_cook
  end
end
