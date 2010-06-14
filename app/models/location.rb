class Location < ActiveRecord::Base
  has_many    :involvements
  has_many    :people, :through => :involvements
  has_many    :incidents


  named_scope :recent, :order => 'updated_at DESC', :limit => 10


  def street
    return "#{self.street_number} #{self.street_name}"
  end

  def full_address
    return "#{self.street_number} #{self.street_name}  #{self.city}, #{self.state}  #{self.postal_code}"
  end

end
