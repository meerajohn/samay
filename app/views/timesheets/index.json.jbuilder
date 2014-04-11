json.array!(@timesheets) do |timesheet|
  json.extract! timesheet, :id, :project_id, :division_id, :employee_id, :entry_date, :entry_period, :status, :activity, :hours, :notes, :created_by, :updated_by
  json.url timesheet_url(timesheet, format: :json)
end
