class AddHasPaidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_paid, :date
  end
end
