class CreateCustomerSets < ActiveRecord::Migration
  def change
    create_table :customer_sets do |t|
      t.string :name
      t.string :rule

      t.timestamps
    end
  end
end
