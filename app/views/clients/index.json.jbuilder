json.array!(@clients) do |client|
  json.extract! client, :id, :code, :name, :contact, :notes, :created_by, :updated_by
  json.url client_url(client, format: :json)
end
