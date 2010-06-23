class Property < ActiveRecord::Base
  has_many  :property_involvements, :foreign_key => 'involved_id'
  has_many  :reports, :through => :property_involvements

  belongs_to  :property_type

  # Show the most recently edited records
  named_scope :recent, :order => 'updated_at DESC', :limit => 10, :include => :property_type

  def self.search(term)
    search = "%#{term}%"
    self.all :joins => [:property_type], :conditions => ["properties.value LIKE ? OR properties.description LIKE ? OR property_types.name LIKE ?",
      search, search, search]
  end
end
