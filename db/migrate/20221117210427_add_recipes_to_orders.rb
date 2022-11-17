class AddRecipesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :recipe, null: false, foreign_key: true
  end
end
