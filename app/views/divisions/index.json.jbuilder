json.array!(@divisions) do |division|
  json.extract! division, :id, :parent_id, :code, :name, :notes, :created_by, :updated_by
  json.url division_url(division, format: :json)
end
