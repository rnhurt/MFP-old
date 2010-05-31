class Person < ActiveRecord::Base
  belongs_to  :person_master
  has_many    :aliases, :through => :person_master
  belongs_to  :personmaster
end
