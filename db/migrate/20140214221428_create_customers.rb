class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.text :custom_data
      t.integer :user_id

      t.timestamps
    end
  end
end
