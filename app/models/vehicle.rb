class Vehicle < ActiveRecord::Base
  #  load_and_authorize_resource

  has_many    :vehicle_involvements, :foreign_key => 'involved_id'
  has_many    :reports, :through => :vehicle_involvements

  belongs_to  :vehicle_make
  belongs_to  :vehicle_model
  belongs_to  :vehicle_color

  named_scope :active, :conditions => {:active => true}
  named_scope :recent, :include => [:vehicle_make, :vehicle_model, :vehicle_color],
    :order => 'updated_at DESC', :limit => 10


  def self.search(search_term)
    term = "%#{search_term}%"
    self.find(:all, :include => [:vehicle_make, :vehicle_model, :vehicle_color],
        :conditions => ["vin LIKE ? OR year LIKE ? OR 'vehicle_colors_vehicles'.value LIKE ? OR 'vehicle_models_vehicles'.value LIKE ?",
        term, term, term, term], :limit => 50)
  end

end
