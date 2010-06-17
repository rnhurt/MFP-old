class CrimeAnalysisController < ApplicationController
  
  def index
    @offence_counts = Offence.find(:all, :joins => :reports,  
      :select => 'codes.value, count(*) AS count',
      :group => 'codes.value',
      :order => 'count DESC')

    @report_counts_by_year = []
    (3).downto 0 do |i|
      blah = Time.now - i.years
      @report_counts_by_year << [blah.year, Report.count(:all, :conditions => { :updated_at => blah.beginning_of_year..blah.end_of_year })]
    end

    @locations = Report.recent.collect{|i| i.location.full_address}

    @map_url = "http://maps.google.com/maps/api/staticmap?sensor=false"
    @map_url << "&markers=color:green|label:R|#{@locations[0..3].join('|')}"
    @map_url << "&markers=color:red|label:G|#{@locations[4..7].join('|')}"
    @map_url << "&markers=color:blue|label:B|#{@locations[8..10].join('|')}"

  end

end
