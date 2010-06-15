class Officer < ActiveRecord::Base
  has_many  :involvements
  has_many  :reports, :through => :reports

  # Methods
  def full_name
    return "#{given_name} #{family_name}"
  end
end
