class CreateCompArrays < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_arrays do |t|
      t.string :description
      t.date :install_date
      t.integer :initial_value
      t.string :location
      t.integer :customer_id

      t.timestamps
    end
  end
end
