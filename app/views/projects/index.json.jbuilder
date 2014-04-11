json.array!(@projects) do |project|
  json.extract! project, :id, :division_id, :client_id, :code, :name, :start_date, :end_date, :manager_id, :notes, :created_by, :updated_by
  json.url project_url(project, format: :json)
end
