class City < ActiveRecord::Base
  belongs_to :state

  default_scope :order => 'name ASC'
end