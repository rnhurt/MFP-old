class CrimeAnalysisController < ApplicationController

  def index
    # FIXME: These SQL statements should really be re-written as ActiveRecord calls
    @report_types = Report.connection.execute("SELECT codes.value, count(*) AS count FROM codes INNER JOIN reports ON reports.offence_id = codes.id GROUP BY codes.value ORDER BY count DESC;")
    @report_years = Report.connection.execute("SELECT strftime('%Y',updated_at), count(*) AS count from reports GROUP BY  strftime('%Y',updated_at) ORDER BY strftime('%Y',updated_at) DESC;")
    # FIXME: Postgres syntax = SELECT extract(year FROM updated_at) AS year, count(*) AS count from reports GROUP BY year ORDER BY year DESC;
  end

end
