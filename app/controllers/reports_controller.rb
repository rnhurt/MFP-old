class ReportsController < ApplicationController

  def index
    @incident_types = Incident.connection.execute("SELECT codes.value, count(*) count FROM codes INNER JOIN incidents ON incidents.offence_id = codes.id GROUP BY codes.id ORDER BY count DESC")
    @incident_years = Incident.connection.execute("SELECT strftime('%Y',updated_at), count(*) count from incidents GROUP BY  strftime('%Y',updated_at) ORDER BY strftime('%Y',updated_at) DESC;")
  end

end
