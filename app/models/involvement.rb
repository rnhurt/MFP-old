class Involvement < ActiveRecord::Base

  belongs_to  :location
  belongs_to  :person
  belongs_to  :incident
  belongs_to  :vehicle
  belongs_to  :property
end
