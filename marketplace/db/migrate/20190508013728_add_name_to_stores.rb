class AddNameToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :name, :website, :logo, :string
  end
end
