class AddColumnsToCustomerSets < ActiveRecord::Migration
  def change
    add_column :customer_sets, :field, :string
    add_column :customer_sets, :comparison, :string
    add_column :customer_sets, :value, :int
  end
end
