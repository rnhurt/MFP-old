class PropertyInvolvement < Involvement
  belongs_to  :property,  :foreign_key => 'involved_id'
  belongs_to  :role,      :foreign_key => 'role_id'
end
