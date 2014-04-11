class ProjectsController < MastersController
  def new
    @master = @master_class.new
  end

  def edit
  end


  def select
    @masters = Project.where(id: "#{params[:id]}") if params[:id].present?
    respond_to do |format|
      format.json { render json: ProjectsSelect.new(@masters, params) }
    end
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:division_id, :client_id, :code, :name, :start_date, :end_date, :manager_id, :notes, :created_by, :updated_by)
  end
end
