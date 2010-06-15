class Property < ActiveRecord::Base
  has_many  :involvements
  has_many  :reports,   :through => :involvements

  belongs_to  :property_type

  # Show the most recently edited records
  named_scope :recent, :order => 'updated_at DESC', :limit => 10

  def self.search(term)
    search = "%#{term}%"
    self.all :joins => [:property_type], :conditions => ["properties.value LIKE ? OR properties.description LIKE ? OR property_types.name LIKE ?",
      search, search, search]
  end
end
