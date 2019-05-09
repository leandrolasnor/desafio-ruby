class Product < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :price, :image, :url, :store_id, :string
  end
end
