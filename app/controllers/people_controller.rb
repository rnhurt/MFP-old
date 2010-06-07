class PeopleController < ApplicationController

  def index
    @people = Person.recent
  end

  def edit
    @person = Person.find(params[:id])

    # Add defaults
    @person.locations << Location.new if !@person.locations.exists?
  end

  

end
