class AddStartAndEndDateToCustomerSet < ActiveRecord::Migration
  def change
    add_column :customer_sets, :start, :date
    add_column :customer_sets, :end, :date
  end
end
