class Property < ActiveRecord::Base
  has_many  :involvements
  has_many  :incidents,   :through => :incidents

  belongs_to  :category

  # Show the most recently edited records
  named_scope :recent, :order => 'updated_at DESC', :limit => 10

  def self.search(term)
    search = "%#{term}%"
    self.all :joins => [:category], :conditions => ["properties.value LIKE ? OR properties.description LIKE ? OR categories.name LIKE ?",
      search, search, search]
  end
end
