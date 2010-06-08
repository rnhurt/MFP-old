class IncidentsController < ApplicationController

  def index
    if params[:new]
      redirect_to :action => :new
    elsif params[:incident]
      @incidents = Incident.search(params[:incident][:term])
    else
      @incidents = Incident.recent
    end
  end

  def new
    @incident = Incident.new
  end

  def create
    @incident = Incident.new(params[:incident])

    if @incident.save
      flash[:notice] = "'#{@incident.number}' was successfully inserted into the system."
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @incident = Incident.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:id])

    if @incident.update_attributes(params[:incident])
      flash[:notice] = "'#{@incident.full_name}' was successfully updated."
      redirect_to :action => :index
    else
      flash[:error] = "'#{@incident.full_name}' failed to update."
      redirect_to :action => :edit
    end
  end

  def autocomplete
    @incidents = Incident.search(params[:term])

    render :partial => 'incidents_table'
  end

end
