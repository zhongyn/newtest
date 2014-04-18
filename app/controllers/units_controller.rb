class UnitsController < ApplicationController

  before_filter :load_unit, :only => [:show, :edit, :update, :destroy]

  def index
  	@units = Unit.order(:name)
  end

  def show
  end

  def new
  	@unit = Unit.new
  end

  def create
  	@unit = Unit.new(unit_params)
  	if @unit.save
  	  redirect_to @unit, notice: "You have successfully created a new unit!" 
  	else
  	  render :new
  	end
  end


  def edit
  end

  def update
  	if @unit.update_attributes(unit_params)
      redirect_to @unit, notice: "You have successfully updated the unit!" 
  	else
  	  render :edit
  	end
  end

  def destroy
  	@unit.destroy
  	redirect_to units_path, notice: "You deleted a unit, why did you do that???"
  end


  private
  def unit_params
    params.require(:unit).permit(:name, :member_count)
  end

  def load_unit
  	@unit = Unit.find(params[:id])
  end

end
