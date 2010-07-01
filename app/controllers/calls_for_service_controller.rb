class CallsForServiceController < ApplicationController

  def index
    @calls = CallForService.recent
  end

  def search
    @calls = CallForService.search(params[:term])
  end

end
