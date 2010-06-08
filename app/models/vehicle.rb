class Vehicle < ActiveRecord::Base
#  load_and_authorize_resource

  has_many  :involvements
  has_many  :incidents, :through => :involvements

  # Show the most recently edited records
  named_scope :recent, :order => 'updated_at DESC', :limit => 10

end
