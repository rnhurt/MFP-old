class PeopleController < ApplicationController

  def index
    @people = Person.recent
  end

  def edit
    @person = Person.find(params[:id])
  end

  

end
