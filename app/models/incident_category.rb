class IncidentCategory < ActiveRecord::Base
  belongs_to  :incident

  named_scope :active, :conditions => {:active => true}
end
