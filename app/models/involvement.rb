class Involvement < ActiveRecord::Base
  belongs_to  :officer
  belongs_to  :location
  belongs_to  :person
  belongs_to  :report
  belongs_to  :vehicle
  belongs_to  :property
end
