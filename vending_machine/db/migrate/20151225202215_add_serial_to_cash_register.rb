class AddSerialToCashRegister < ActiveRecord::Migration
  def change
    add_column :cash_registers, :serial, :string, index: true
  end
end
