class IncidentsController < ApplicationController

  def index
    respond_to do |format|
      format.html { @incidents = Incident.recent }
      format.js {
        incidents = Incident.find(:all, :conditions => ['number LIKE ?', "%#{params[:term]}%"])
        render :js => incidents.collect{|i| i.number}
      }
    end
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

  def edit
    @incident = Incident.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:id])

    if @incident.update_attributes(params[:incident])
      flash[:notice] = "Incident '#{@incident.number}' was successfully updated."
    else
      flash[:error] = "Course '#{@course.name}' failed to update."
    end

    redirect_to :action => 'edit'
  end

  
  def redirect
    redirect_to :action => 'index'
  end

end
