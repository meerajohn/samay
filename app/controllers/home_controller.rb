class HomeController < ApplicationController
  def index
    @projects = Project.order('created_at desc').limit(8)
  end

  def about
  end

  def policies
  end

  def projects
    @projects = Project.page(params[:page]).per(12)
  end
end
