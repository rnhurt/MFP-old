class Location < ActiveRecord::Base
  has_many  :involvements
end
