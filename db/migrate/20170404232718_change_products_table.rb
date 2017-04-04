class ChangeProductsTable < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :image, :text
  end
end
