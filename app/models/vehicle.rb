class Vehicle < ActiveRecord::Base
  has_many  :involvements
  has_many  :incidents, :through => :involvements
end
