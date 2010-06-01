class Person < ActiveRecord::Base
  belongs_to  :person_master
  has_many    :aliases, :through => :person_master

  has_many    :involvements
  has_many    :incidents, :through => :involvements
  has_many    :locations, :through => :involvements

  def full_name
    return "#{first_name} #{last_name}"
  end
end
