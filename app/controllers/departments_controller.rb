class DepartmentsController < MastersController
private

  def department_params
    params.require(:department).permit(:code, :name, :kind, :manager_id, :notes, :created_by, :updated_by)
  end
end
