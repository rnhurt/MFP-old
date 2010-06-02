class Location < ActiveRecord::Base
  # Associations
  has_many    :involvements
  has_many    :people, :through => :involvements
  has_many    :incidents

  # Methods
  def address
    return "#{self.street_number} #{self.street_name}"
  end

  def full_address
    return "#{self.street_number} #{self.street_name}  #{self.city}, #{self.state}  #{self.postal_code}"
  end

end
