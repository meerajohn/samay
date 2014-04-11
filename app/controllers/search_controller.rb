class SearchController < ApplicationController
  authorize_resource class: false

  def results
    if params[:s].present?
      search = "%#{params[:s].gsub(/\s+/, '%')}%"
      @projects = Project.where('name ilike :search', search: search)
      @clients = Client.where('name ilike :search', search: search)
      @employees = Employee.where('name ilike :search', search: search)
    end
  end

private

  def search_params
    params.require(:search).permit(:s)
  end
end
