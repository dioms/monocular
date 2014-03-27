class AddUserIdToCustomerSet < ActiveRecord::Migration
  def change
    add_column :customer_sets, :user_id, :integer
  end
end
