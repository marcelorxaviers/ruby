class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :from_domain
      t.index :from_domain
      t.string :to_domain

      t.timestamps
    end
  end
end
