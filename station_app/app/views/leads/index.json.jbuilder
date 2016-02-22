json.array!(@leads) do |lead|
  json.extract! lead, :id, :name, :last_name, :email, :company_name, :job_title, :phone, :website, :on_zoho, :company_id
  json.url lead_url(lead, format: :json)
end
