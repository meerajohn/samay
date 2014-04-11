json.array!(@pipelines) do |pipeline|
  json.extract! pipeline, :id, :project_id, :division_id, :employee_id, :reserved_date, :status, :notes, :created_by, :updated_by
  json.url pipeline_url(pipeline, format: :json)
end
