class NcicCode < ActiveRecord::Base
  named_scope :states,          :conditions => {:code_type => 'State'}
  named_scope :offences,        :conditions => {:code_type => 'Offence'}
  named_scope :vehicle_models,  :conditions => {:code_type => 'VModel'}
  named_scope :vehicle_makes,   :conditions => {:code_type => 'VMake'}
  named_scope :races,           :conditions => {:code_type => 'Race'}
  named_scope :eye_colors,      :conditions => {:code_type => 'EColor'}
  named_scope :hair_colors,     :conditions => {:code_type => 'HColor'}
end
