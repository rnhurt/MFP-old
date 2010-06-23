class PropertiesController < ApplicationController

  def index
    if params[:new]
      redirect_to :action => :new
    elsif params[:property]
      @properties = Property.search(params[:property][:term])
    else
      @properties = Property.recent
    end
  end

  def new
    @property = Property.new
  end

  def edit
    @property = Property.find(params[:id])
  end

  def create
    @property = Property.new(params[:property])

    if @property.save
      flash[:notice] = 'Property was successfully created.'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def update
    @property = Property.find(params[:id])

    if @property.update_attributes(params[:property])
      flash[:notice] = 'Property was successfully updated.'
      redirect_to :action => :index
    else
      flash[:error] = "The property failed to update."
      redirect_to :action => :edit
    end
  end

  def search
    @properties = Property.search(params[:term])
  end
end
