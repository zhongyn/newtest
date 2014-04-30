class StatusesController < ApplicationController

  before_filter :load_status, :only => [:show, :edit, :update, :destroy]
  
  def index
  	@statuses = Status.order(:name)
  end

  def new
  	@status = Status.new
  end

  def create
  	@status = Status.new(status_params)
  	if @status.save
  	  redirect_to @status, notice: "You have successfully created a new status!" 
  	else
  	  render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @status.update_attributes(status_params)
      redirect_to @status, notice: "You have successfully updated the status!" 
  	else
  	  render :edit
  	end
  end

  def destroy
  	@status.destroy
  	redirect_to statuses_path, alert: "You deleted a status, why did you do that???"
  end




private
  def status_params
    params.require(:status).permit(:name, :project_count)
  end

  def load_status
  	@status = Status.find(params[:id])
  end

end
