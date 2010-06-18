class VehicleInvolvement < Involvement
  belongs_to  :vehicle, :foreign_key => 'involved_id'
end
