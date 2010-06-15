class CrimeAnalysisController < ApplicationController

  def index
    @report_types = Report.connection.execute("SELECT codes.value, count(*) count FROM codes INNER JOIN reports ON reports.offence_id = codes.id GROUP BY codes.id ORDER BY count DESC")
    @report_years = Report.connection.execute("SELECT strftime('%Y',updated_at), count(*) count from reports GROUP BY  strftime('%Y',updated_at) ORDER BY strftime('%Y',updated_at) DESC;")
  end

end
