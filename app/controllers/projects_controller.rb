class ProjectsController < ApplicationController
  
  before_filter :load_unit


  def index
	@projects = Project.order(:name)
  end

  def new
	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to unit_projects_path(@unit), notice: "You have successfully created a new project!"
  	else
  		render :new
  	end
  end

  def show
  end

  private
  def project_params
  	params.require(:project).permit(:name, :description)
  end

  def load_project
  	@project = Project.find(params[:id])
  end

  def load_unit
  	@unit = Unit.find(params[:unit_id])
  end  	

end
