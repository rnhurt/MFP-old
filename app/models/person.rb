class Person < ActiveRecord::Base
  belongs_to  :person_master
  has_many    :aliases, :through => :person_master

  has_many    :person_involvements, :foreign_key => 'involved_id'
  has_many    :reports, :through => :person_involvements

  has_many    :addresses
  has_many    :locations, :through => :addresses

  belongs_to  :race
  belongs_to  :gender
  belongs_to  :hair_color
  belongs_to  :eye_color
  belongs_to  :state

  default_scope :order => 'updated_at DESC'

  # Show the most recently edited records
  named_scope :recent, :limit => 10

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
