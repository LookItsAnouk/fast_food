class AddPendingAndApprovedColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :pending?, :boolean
    add_column :orders, :approved?, :boolean
  end
end
