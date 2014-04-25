class ProjectsController < ApplicationController
  
  before_filter :load_unit
  before_filter :load_project, :only => [:show, :edit, :update, :destroy]

  def index
	@projects = @unit.projects.order(:name)
  end

  def new
	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	@project.unit = @unit

    # try to save the project, if successful forward to the project list
  	if @project.save
  		redirect_to unit_projects_path, notice: "You have successfully created a new project!"
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @project.update_attributes(project_params)
  		redirect_to unit_project_path(@unit,@project), notice: "You have successfully updated the project!"
  	else
  		render :edit
  	end
  end

  def destroy
  	@project.destroy
  	redirect_to unit_projects_path, notice: "Hey, you just deleted a project."
  end

  private
  def project_params
  	params.require(:project).permit(:name, :description)
  end

  # This method loads a project
  def load_project
  	@project = @unit.projects.find(params[:id])
  end

  # This method loads the unit we are working with
  def load_unit
  	@unit = Unit.find(params[:unit_id])
  end  	

end
