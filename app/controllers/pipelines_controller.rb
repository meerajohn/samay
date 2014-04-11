class PipelinesController < ApplicationController
  load_and_authorize_resource
  before_action :set_pipeline, only: [:show, :edit, :update, :destroy]

  # GET /pipelines
  # GET /pipelines.json
  def index
    @pipelines = Pipeline.order("status desc, id desc").page(params[:page])
  end

  # GET /pipelines/1
  # GET /pipelines/1.json
  def show
  end

  # GET /pipelines/new
  def new
    @pipeline = Pipeline.new
  end

  # GET /pipelines/1/edit
  def edit
  end

  # POST /pipelines
  # POST /pipelines.json
  def create
    @pipeline = Pipeline.new(pipeline_params)

    respond_to do |format|
      if @pipeline.save
        format.html { redirect_to @pipeline, notice: 'Pipeline was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pipeline }
      else
        format.html { render action: 'new' }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pipelines/1
  # PATCH/PUT /pipelines/1.json
  def update
    respond_to do |format|
      if @pipeline.update(pipeline_params)
        format.html { redirect_to @pipeline, notice: 'Pipeline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    @pipeline = Pipeline.find params[:pipeline_id]
    respond_to do |format|
      if @pipeline.cancel!
        format.html { redirect_to @pipeline, notice: 'Project was successfully canceled.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @pipeline, notice: 'Project could not be canceled due to errors.' }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  def close
    @pipeline = Pipeline.find params[:pipeline_id]
    respond_to do |format|
      if @pipeline.close!
        format.html { redirect_to @pipeline, notice: 'Project was successfully closed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @pipeline, notice: 'Project could not be closed due to errors.' }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pipelines/1
  # DELETE /pipelines/1.json
  def destroy
    @pipeline.destroy
    respond_to do |format|
      format.html { redirect_to pipelines_url }
      format.json { head :no_content }
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_pipeline
    @pipeline = Pipeline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pipeline_params
    params.require(:pipeline).permit(:project_id, :division_id, :employee_id, :reserved_date, :status, :notes, :created_by, :updated_by)
  end
end
