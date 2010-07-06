class PersonInvolvement < Involvement
  belongs_to  :person,  :foreign_key => 'involved_id'
  belongs_to  :role#,    :foreign_key => 'role_id'
  belongs_to  :report
end
