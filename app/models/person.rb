class Person < ActiveRecord::Base
  belongs_to  :person_master
  has_many    :aliases, :through => :person_master

  has_many    :involvements
  has_many    :incidents, :through => :involvements
  has_many    :locations, :through => :involvements


  # Show the most recently edited records
  named_scope :recent, :order => 'updated_at DESC', :limit => 10

  # Convenience method to return the persons full name
  def full_name
    return "#{first_name} #{last_name}"
  end

  def self.search(term)
    search = "%#{term}%"
    self.find(:all, :conditions => ["first_name || ' ' || last_name LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR ssn LIKE ?",
        search, search, search, search])
  end
end
