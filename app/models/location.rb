class Location < ActiveRecord::Base
  has_many  :involvements
  has_many  :people, :through => :involvements

  has_many  :incidents

end
