class CreateCompaniesUsers < ActiveRecord::Migration
  def change
    create_table :companies_users, :id => false do |t|
      t.references :company, :user
    end
    add_index :companies_users, [:company_id, :user_id]
  end
end


