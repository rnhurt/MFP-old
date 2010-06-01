class Incident < ActiveRecord::Base
  has_many  :involvements
  has_many  :people, :through => :involvements
  has_many  :vehicles, :through => :involvements
  has_many  :properties, :through => :involvements

  belongs_to  :location

  belongs_to  :incident_cat

  validates_length_of :number, :minimum => 1
end
