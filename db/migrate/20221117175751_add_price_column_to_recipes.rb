class AddPriceColumnToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :price, :float
  end
end
