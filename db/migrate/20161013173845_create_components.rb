class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :description
      t.date :install_date
      t.integer :initial_value
      t.integer :comp_array_id

      t.timestamps
    end
  end
end
