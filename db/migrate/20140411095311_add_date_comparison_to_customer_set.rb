class AddDateComparisonToCustomerSet < ActiveRecord::Migration
  def change
    add_column :customer_sets, :date_comparison, :string
  end
end
