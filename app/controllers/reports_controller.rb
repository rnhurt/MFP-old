class ReportsController < ApplicationController

  def index
    @incident_types = Incident.connection.execute("SELECT codes.value, count(*) count FROM codes INNER JOIN incidents ON incidents.offence_id = codes.id GROUP BY codes.id ORDER BY count DESC")
    @incident_years = Incident.connection.execute("SELECT strftime('%Y',updated_at), count(*) count from incidents GROUP BY  strftime('%Y',updated_at) ORDER BY strftime('%Y',updated_at) DESC;")

    #    @flot = Flot.new('graph') do |f|
    #      f.series("Line One", [[1,9], [2,18], [3,36], [4,26]])
    #      f.series("Line Two", [[1,4], [2,8], [3,12], [4,23]])
    #    end


    #    @flot = TimeFlot.new('graph') do |f|
    #      f.bars
    #      f.grid :hoverable => true
    #      f.selection :mode => "xy"
    #      f.filter {|collection| collection.select {|j| j.entry_date < Date.parse("7/8/2007")}}
    #      f.series_for("Stress", @journals, :x => :entry_date, :y => :stress_rating)
    #      f.series_for("Hours of Sleep", @migraines, :x => :entry_date, :y => :hours_of_sleep)
    #      f.series_for("Restful Night?", @migraines, :x => :entry_date, :y => lambda {|record| record.restful_night ? 5 : 0 }, :options => {:points => {:show => true}, :bars => {:show => false}})
    #      f.series_for("Migraines", @migraines, :x => :entry_date, :y => lambda {|record| record.migraine? ? 4 : nil }, :options => {:points => {:show => true}, :bars => {:show => false}})
    #    end

  end

end
