class Incident < ActiveRecord::Base
  # Associations
  has_many  :involvements
  has_many  :officers,    :through => :involvements
  has_many  :people,      :through => :involvements
  has_many  :vehicles,    :through => :involvements
  has_many  :properties,  :through => :involvements

  belongs_to  :location
  belongs_to  :offence

  # Validations
  validates_length_of     :number, :minimum => 1
  validates_uniqueness_of :number, :message => "has already been used.  Please enter a different number or edit the correct incident."

 
  named_scope :recent, :order => 'dispatched_at DESC', :limit => 10

  
  def self.search(term)
    self.find(:all, :conditions => ['number LIKE ?', "%#{term}%"])
  end

end
