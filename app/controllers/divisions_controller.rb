class DivisionsController < MastersController
private

  def division_params
    params.require(:division).permit(:parent_id, :code, :name, :notes, :created_by, :updated_by)
  end
end
