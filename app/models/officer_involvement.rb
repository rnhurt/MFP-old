class OfficerInvolvement < Involvement
  belongs_to  :report
  belongs_to  :officer, :foreign_key => 'involved_id'
  belongs_to  :role,    :foreign_key => 'role_id'
end
