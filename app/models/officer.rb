class Officer < ActiveRecord::Base
  has_many  :involvements
  has_many  :incidents, :through => :incidents

  # Methods
  def full_name
    return "#{given_name} #{family_name}"
  end
end
