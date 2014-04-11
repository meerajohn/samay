module SelectHelper
  def employee_collection(employees)
    employees.map do |employee|
      [employee.name, employee.id, data: { data: EmployeesSelect.new([employee]).as_json.first }] \
        if employee
    end
  end

  def project_collection(projects)
    projects.map do |project|
      [project.name, project.id, data: { data: ProjectsSelect.new([project]).as_json.first }] \
        if project
    end
  end
end
