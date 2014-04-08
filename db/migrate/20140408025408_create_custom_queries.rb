class CreateCustomQueries < ActiveRecord::Migration
  def change
    create_table :custom_queries do |t|
      t.string :field
      t.string :comparison
      t.string :value

      t.timestamps
    end
  end
end
