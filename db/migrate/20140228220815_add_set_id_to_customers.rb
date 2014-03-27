class AddSetIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :set_id, :integer
  end
end
