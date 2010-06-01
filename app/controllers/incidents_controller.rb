class IncidentsController < ApplicationController

  def index
    @incident = Incident.new
  end
  
  def create
    @incident = Incident.create(:number => params[:incident][:number])

    if @incident.save
      flash[:notice] = "Incident '#{@incident.number}' was successfully created."
      render :action => 'edit'
    else
      render :action => 'new'
    end    
  end

  def redirect
    redirect_to :action => 'index'
  end

end
