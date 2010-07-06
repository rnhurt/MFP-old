class Officer < User
  has_many  :officer_involvements, :foreign_key => 'involved_id'
  has_many  :reports, :through => :officer_involvements
end
