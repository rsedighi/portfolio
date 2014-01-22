class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      # we'll get to this in a bit
    end
  end

  def show
    @project = Project.find(params[:id])
  end

private



  def project_params
    params.require(:project).permit(:title, :technologies_used)
  end
end