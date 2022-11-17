class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: { unique: true }
      t.string :password_digest
      t.string :address
      t.string :phone
      t.boolean :is_cook?

      t.timestamps
    end
  end
end
