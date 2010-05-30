class PeopleController < ApplicationController

  def index

  end
    
  def redirect
    redirect_to :action => 'index'
  end


end
