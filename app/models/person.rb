class Person < ActiveRecord::Base
  has_many    :aliases
  belongs_to  :personmaster
end
