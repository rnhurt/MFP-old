class PeopleController < ApplicationController

  def index
    
    @cities = City.find(:all,:conditions => ['name LIKE ?', "#{params[:q]}%"],  :limit => 5, order => 'name')
    respond_to do |format|
      format.html { @states = State.all }

      format.xml  { render xml => @cities }
      format.js
      format.json { render :json => @cities }
    end
  end
    
  def redirect
    redirect_to :action => 'index'
  end


end
