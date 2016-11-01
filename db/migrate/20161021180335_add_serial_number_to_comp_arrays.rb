class AddSerialNumberToCompArrays < ActiveRecord::Migration[5.0]
  def change
    add_column :comp_arrays, :serial_number, :string
  end
end
