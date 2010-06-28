class ReportsController < ApplicationController

  def index
    if params[:new]
      redirect_to :action => :new
    elsif params[:report]
      @reports = Report.search(params[:report][:term])
    else
      @reports = Report.recent
    end
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(params[:report])

    if @report.save
      flash[:notice] = "'#{@report.number}' was successfully inserted into the system."
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if @report.update_attributes(params[:report])
      flash[:notice] = "'#{@report.number}' was successfully updated."
      redirect_to :action => :index
    else
      flash[:error] = "'#{@report.number}' failed to update."
      redirect_to :action => :edit
    end
  end

  def redirect
    redirect_to :action => :index
  end

  def search
    @reports = Report.search(params[:term])
  end

end
