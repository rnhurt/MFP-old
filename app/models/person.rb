class Person < ActiveRecord::Base
  belongs_to  :person_master
  has_many    :aliases, :through => :person_master

  has_many    :involvements
  has_many    :incidents, :through => :involvements
  has_many    :locations, :through => :involvements



  # Convenience method to return the persons full name
  def full_name
    return "#{first_name} #{last_name}"
  end

  # Show the most recently edit people
  named_scope :recent, :order => 'updated_at DESC', :limit => 10

end
