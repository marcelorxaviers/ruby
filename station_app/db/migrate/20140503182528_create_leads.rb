class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.string :job_title
      t.string :phone
      t.string :website
      t.boolean :on_zoho
      t.references :company, index: true

      t.timestamps
    end
  end
end
