json.array!(@departments) do |department|
  json.extract! department, :id, :code, :name, :kind, :manager_id, :notes, :created_by, :updated_by
  json.url department_url(department, format: :json)
end
