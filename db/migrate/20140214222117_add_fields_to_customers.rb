class AddFieldsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :id_on_app, :integer
    add_column :customers, :email, :string
  end
end
