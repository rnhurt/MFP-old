class PeopleController < ApplicationController

  def index
    if params[:new]
      redirect_to :action => :new
    elsif params[:person]
      @people = Person.search(params[:person][:term])
    else
      @people = Person.recent
    end
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])

    if @person.save
      flash[:notice] = "'#{@person.full_name}' was successfully inserted into the system."
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @person = Person.find(params[:id], :include => [:person_involvements, :locations])

    # Add defaults
#    @person.locations << Location.new if !@person.locations.exists?
  end

  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(params[:person])
      flash[:notice] = "'#{@person.full_name}' was successfully updated."
      redirect_to :action => :index
    else
      flash[:error] = "'#{@person.full_name}' failed to update."
      redirect_to :action => :edit
    end
  end

  def search
    @people = Person.search(params[:term])
  end
  
end
