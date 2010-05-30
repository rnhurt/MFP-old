class Incident < ActiveRecord::Base
  has_many  :involvements
  has_one   :incident_category

  validates_length_of :number, :minimum => 1
end
