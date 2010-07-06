class PersonLocation < ActiveRecord::Base
#  has_many    :involvements
  belongs_to  :person
  belongs_to  :location
  belongs_to  :role
end
