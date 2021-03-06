class Role < Code
  has_many  :officer_involvements
  has_many  :person_locations

  named_scope :officer, :conditions => { :code => 'Officer' }
  named_scope :person,  :conditions => { :code => 'Person' }
  named_scope :address, :conditions => { :code => 'Address' }

end
