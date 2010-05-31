class PersonMaster < ActiveRecord::Base
  has_many  :people
  has_many  :aliases, :through => :people
end
