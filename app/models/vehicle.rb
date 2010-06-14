class Vehicle < ActiveRecord::Base
  #  load_and_authorize_resource

  has_many  :involvements
  has_many  :incidents, :through => :involvements

  named_scope :active, :conditions => {:active => true}
  named_scope :recent, :order => 'updated_at DESC', :limit => 10


  def self.search(term)
    search = "%#{term}%"
    self.find(:all, :conditions => ["vin LIKE ? OR make LIKE ? OR model LIKE ? OR year LIKE ? OR color LIKE ?",
        search, search, search, search, search])
  end

end
