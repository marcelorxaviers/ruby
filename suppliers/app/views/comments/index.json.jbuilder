json.array!(@comments) do |comment|
  json.extract! comment, :id, :supplier_id, :body
  json.url comment_url(comment, format: :json)
end
