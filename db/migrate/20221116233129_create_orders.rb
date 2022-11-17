class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :payment_type
      t.string :delivery_type
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
