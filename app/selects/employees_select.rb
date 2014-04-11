class EmployeesSelect
  def initialize(employees, params = {})
    @employees = employees
    @params = params
  end

  def as_json(options = {})
    data
  end

  private

  def data
    employees.map do |employee|
      { id: employee.id,
        code: employee.code,
        name: employee.name,
        detail: employee.depertment.name,
        image: "/employees/#{employee.id}/photo/select"
      }
    end
  end

  def search_employees
    employees = Employee.includes(:department).order("employees.name")
    employees = employees.where("employees.name ilike :search or employees.code ilike :search", search: "%#{@params[:s]}%") \
    if @params[:s].present?
      employees.limit(@params[:per] || 10)
  end

  def employees
    employees = @employees || search_employees
  end
end
