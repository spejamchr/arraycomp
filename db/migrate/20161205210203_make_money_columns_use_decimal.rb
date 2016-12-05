class MakeMoneyColumnsUseDecimal < ActiveRecord::Migration[5.0]
  def up
    change_column :comp_arrays, :initial_value, :decimal, precision: 11, scale: 2
    change_column :components, :initial_value, :decimal, precision: 11, scale: 2
  end

  def down
    change_column :comp_arrays, :initial_value, :integer
    change_column :components, :initial_value, :integer
  end
end
