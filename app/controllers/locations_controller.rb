class LocationsController < ApplicationController

  def index
    if params[:new]
      redirect_to :action => :new
    elsif params[:location]
      @locations = Location.search(params[:location][:term])
    else
      @locations = Location.recent
    end
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])

    if @location.save
      flash[:notice] = "The location was successfully inserted into the system."
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(params[:location])
      flash[:notice] = "The location was successfully updated."
      redirect_to :action => :index
    else
      flash[:error] = "The location failed to update."
      redirect_to :action => :edit
    end
  end

  def search
    @locations = Location.search(params[:term])
  end

end
