class ProjectsSelect
  def initialize(projects, params = {})
    @projects = projects
    @params = params
  end

  def as_json(options = {})
    data
  end

  private

  def data
    projects.map do |project|
      { id: project.id,
        code: project.code,
        name: project.name,
      }
    end
  end

  def search_projects
    projects = Project.order("projects.name")
    projects = projects.where("projects.name ilike :search or items.code ilike :search", search: "%#{@params[:s]}%") \
    if @params[:s].present?
      projects.limit(@params[:per] || 10)
  end

  def projects
    projects = @projects || search_projects
  end

  delegate :params, :h, :link_to, :raw, to: :@view

  def initialize(view, projects)
    @view = view
    @projects = projects
  end

  def as_json(options = {})
    { options: data }
  end

private

  def data
    projects.map do |project|
      { id: project.id,
        code: project.code,
        name: project.name,
        detail: project.client.name,
      }
    end
  end

  def projects
    projects = Project.includes(:division).order("projects.name")
    projects = projects.where("projects.name ilike :search or projects.code ilike :search", search: "%#{params[:s]}%") if params[:s].present?
    projects = projects.where(id: "#{params[:id]}") if params[:id].present?
    projects.limit(params[:per])
  end
end
