class LocationsController < ApplicationController

  def index
    @locations = Location.recent
  end

  
  def search
    @locations = Location.search(params[:term])
  end

end
