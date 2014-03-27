class AddCustomerIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :customer_id, :integer
  end
end
