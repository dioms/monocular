class AddHasPaidToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :has_paid, :date
  end
end
