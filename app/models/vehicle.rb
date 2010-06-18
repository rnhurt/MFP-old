class Vehicle < ActiveRecord::Base
  #  load_and_authorize_resource

  has_many    :vehicle_involvements
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
        :conditions => ["vin LIKE ? OR year LIKE ?",
        term, term])
  end

end
