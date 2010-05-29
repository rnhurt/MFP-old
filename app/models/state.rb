class State < ActiveRecord::Base
  has_many :cities

  default_scope :order => 'name ASC'
end