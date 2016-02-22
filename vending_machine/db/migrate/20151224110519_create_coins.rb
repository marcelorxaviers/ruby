class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :representation
      t.float :value, precision: 2      
      t.integer :coin_id, unique: true
    end
    add_index :coins, :coin_id
  end
end
