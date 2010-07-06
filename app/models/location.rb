class Location < ActiveRecord::Base
#  has_many    :involvements
  has_many  :person_locations
  has_many  :reports

  named_scope :recent, :order => 'updated_at DESC', :limit => 10

  def street
    return "#{self.street_number} #{self.street_name}"
  end

  def full_address
    return "#{self.street_number} #{self.street_name}  #{self.city}, #{self.state}  #{self.postal_code}"
  end

  def self.search(term)
    search = "%#{term}%"
    self.find(:all, :conditions => ['street_number LIKE ? OR street_name LIKE ? OR city LIKE ? OR postal_code LIKE ?',
        search, search, search, search])
  end

end
