json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :name, :email, :site, :phone
  json.url supplier_url(supplier, format: :json)
end
