class FixOrderColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :pending?, :pending
    rename_column :orders, :approved?, :approved
  end
end
