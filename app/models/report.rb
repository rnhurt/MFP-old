class Report < ActiveRecord::Base
  # Associations
  has_many  :officer_involvements
  has_many  :officers,  :through => :officer_involvements

  has_many  :vehicle_involvements
  has_many  :vehicles,  :through => :vehicle_involvements
  
  has_many  :person_involvements
  has_many  :people,    :through => :person_involvements

  has_many  :property_involvements
  has_many  :properties,  :through => :property_involvements
  
  belongs_to  :location
  belongs_to  :offense

  # Validations
  validates_length_of     :number, :minimum => 1
  validates_uniqueness_of :number, :message => "has already been used.  Please enter a different number or edit the correct report."

 
  named_scope :recent, :order => 'dispatched_at DESC', :limit => 10, :include => [:location, :offense]

  
  def self.search(term)
    search = "%#{term}%"
    self.find(:all, :include => [:offense, :location],
      :conditions => ["number LIKE ? OR 'offense_offenses'.value LIKE ?",
        search, search], :limit => 50)
  end

end
