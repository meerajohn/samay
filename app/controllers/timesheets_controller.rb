class TimesheetsController < ApplicationController
  load_and_authorize_resource
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /timesheets
  # GET /timesheets.json
  def index
    @timesheets = Timesheet.order("status desc, id desc").page(params[:page])
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
  end

  # GET /timesheets/1/edit
  def edit
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = Timesheet.new(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def cancel
    @timesheet = Timesheet.find params[:timesheet_id]
    respond_to do |format|
      if @timesheet.cancel!
        format.html { redirect_to @timesheet, notice: 'Project was successfully canceled.' }
      else
        format.html { redirect_to @timesheet, notice: 'Project could not be canceled due to errors.' }
      end
    end
  end

  def close
    @timesheet = Timesheet.find params[:timesheet_id]
    respond_to do |format|
      if @timesheet.close!
        format.html { redirect_to @timesheet, notice: 'Project was successfully returned.' }
      else
        format.html { redirect_to @timesheet, notice: 'Project could not be returned due to errors.' }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    respond_to do |format|
      if @timesheet.destroy
        format.html { redirect_to timesheets_url }
      else
        format.html { redirect_to @timesheet, alert: @timesheet.errors[:base][0] }
      end
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_timesheet
    @timesheet = Timesheet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timesheet_params
    params.require(:timesheet).permit(:project_id, :division_id, :employee_id, :entry_date, :entry_period, :status, :activity, :hours, :notes, :created_by, :updated_by)
  end
end
