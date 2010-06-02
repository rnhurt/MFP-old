class Property < ActiveRecord::Base
  has_many  :involvements
  has_many  :incidents,   :through => :incidents

  belongs_to  :category
end
