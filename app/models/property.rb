class Property < ActiveRecord::Base
  has_many  :involvements
  has_many  :incidents, :through => :incidents
end
