class Role < Code
  has_many  :officer_involvements


  named_scope :officer, :conditions => { :code => 'Officer' }
  named_scope :person,  :conditions => { :code => 'Person' }

end
