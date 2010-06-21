class VehicleInvolvement < Involvement
  belongs_to  :vehicle, :foreign_key => 'involved_id'
  belongs_to  :status,  :foreign_key => 'role_id'
end
