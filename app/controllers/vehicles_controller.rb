class VehiclesController < ApplicationController

  def index
    if params[:new]
      redirect_to :action => :new
    elsif params[:vehicle]
      @vehicles = Vehicle.search(params[:vehicle][:term])
    else
      @vehicles = Vehicle.recent
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])

    if @vehicle.save
      flash[:notice] = "The vehicle was successfully inserted into the system."
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update_attributes(params[:vehicle])
      flash[:notice] = "The vehicle was successfully updated."
      redirect_to :action => :index
    else
      flash[:error] = "The vehicle failed to update."
      redirect_to :action => :edit
    end
  end

  def search
    @vehicles = Vehicle.search(params[:term])
  end

end
