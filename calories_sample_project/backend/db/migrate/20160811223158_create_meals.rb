class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.date :day
      t.integer :time
      t.decimal :calories
      t.integer  :user_id
      t.string  :note

      t.timestamps null: false
    end
    
    add_index :meals, :user_id
  end
end
