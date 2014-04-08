class AddCustomerSetIdToCustomQuery < ActiveRecord::Migration
  def change
    add_column :custom_queries, :customer_set_id, :integer
  end
end
