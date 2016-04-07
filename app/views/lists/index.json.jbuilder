json.array!(@lists) do |list|
  json.extract! list, :id, :name, :name_encoded
  json.url list_url(list, format: :json)
end
