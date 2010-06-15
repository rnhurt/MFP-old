class JavascriptsController < ApplicationController
  def dynamic_vmodels
    @models = NcicCode.vehicle_models.all
    #    @models = NcicCode.connection.execute("SELECT DISTINCT make.code code, model.value value FROM ncic_codes make, ncic_codes model WHERE make.code_type = 'VModel' and model.code_type = 'VMake' and make.code = model.code;")
  end

  def incident_map
    # Get the locations of the most recent incidents
    @locations = Report.recent.collect{|i| i.location}
  end

end
