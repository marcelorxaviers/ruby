class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.text :email
      t.text :site
      t.text :phone

      t.timestamps
    end
  end
end
