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
      flash[:notice] = "'#{@vehicle.vin}' was successfully inserted into the system."
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
      flash[:notice] = "'#{@vehicle.vin}' was successfully updated."
      redirect_to :action => :index
    else
      flash[:error] = "'#{@vehicle.vin}' failed to update."
      redirect_to :action => :edit
    end
  end

  def autocomplete
    @vehicle = Vehicle.search(params[:term])

    render :partial => 'people'
  end

end
