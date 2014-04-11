class EmployeesController < MastersController
  def new
    @master = Employee.new
    @master.build_address
  end

  def edit
    @master.build_address unless @master.address
  end

  def photo
    @master = Employee.where(id: params[:employee_id]).first
    version = params[:version]

    if File.file?(@master.photo_url(version).to_s)
      photo = @master.photo_url(version).to_s
    else
      photo = @master.photo.versions[version.to_sym].default_url
    end

    expires_in 24.hours, public: false
    send_file(photo, disposition: 'inline', x_sendfile: true)
  end

  def select
    @masters = Employee.where(id: "#{params[:id]}") if params[:id].present?
    respond_to do |format|
      format.json { render json: EmployeesSelect.new(@masters, params) }
    end
  end

private

  def employee_params
    params.require(:employee).permit(:department_id, :code, :name, :designation, :join_date, :user_id, :manager_id, :status, :photo, :notes, :created_by, :updated_by,
                                     address_attributes: [:id, :line_1, :line_2, :landmark, :city,
                                                          :state, :country, :postal_code, :mobile,
                                                          :phone_1, :phone_2, :email_1, :email_2])
  end
end
