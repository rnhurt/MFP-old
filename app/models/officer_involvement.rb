class OfficerInvolvement < Involvement
  belongs_to  :officer,       :foreign_key => 'involved_id'
  belongs_to  :officer_role,  :foreign_key => 'Zrole_id'
#  has_one :officer_role
end
