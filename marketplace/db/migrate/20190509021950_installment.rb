class Installment < ActiveRecord::Migration[5.2]
  def change
    add_column :installments, :value, :interestrate, :totalvalueplusinterestrate, :numberofinstallments, :paymentsystemname, :paymentsystemgroupname, :name, :product_id, :string
  end
end
