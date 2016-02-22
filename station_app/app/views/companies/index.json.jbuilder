json.array!(@companies) do |company|
  json.extract! company, :id, :name, :zoho_token, :user_id
  json.url company_url(company, format: :json)
end
