class Vehicle < ActiveRecord::Base
  load_and_authorize_resource

  has_many  :involvements
  has_many  :incidents, :through => :involvements
end
