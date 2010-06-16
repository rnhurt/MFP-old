class CrimeAnalysisController < ApplicationController

  def index
    @offence_counts = Offence.find(:all, :joins => :reports,  
      :select => 'codes.*, count(*) AS count', 
      :group => 'codes.value',
      :order => 'count DESC')
    @report_years = Report.connection.execute("SELECT strftime('%Y',updated_at), count(*) AS count from reports GROUP BY  strftime('%Y',updated_at) ORDER BY strftime('%Y',updated_at) DESC;")
    # FIXME: Postgres syntax = SELECT extract(year FROM updated_at) AS year, count(*) AS count from reports GROUP BY year ORDER BY year DESC;

    @report_counts_by_year = Offence.find(:all, :joins => :reports,
      :select => 'codes.*, count(*) AS count',
      :group => 'updated_at',
      :order => 'count DESC')
  end

end
