json.array!(@employees) do |employee|
  json.extract! employee, :id, :department_id, :code, :name, :designation, :join_date, :user_id, :manager_id, :status, :active, :notes, :created_by, :updated_by
  json.url employee_url(employee, format: :json)
end
