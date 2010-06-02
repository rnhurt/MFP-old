class Category < ActiveRecord::Base
  belongs_to  :category
  has_many    :properties

  named_scope :active, :conditions => {:active => true}
#  named_scope :locations,   :conditions => {:category_type => 'Location'}
  named_scope :properties,  :conditions => {:category_type => 'Property'}
  named_scope :incidents,   :conditions => {:category_type => 'Incident'}
  named_scope :contacts,    :conditions => {:category_type => 'Contact'}

end
