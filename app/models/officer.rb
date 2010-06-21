class Officer < User
  has_many  :officer_involvements, :foreign_key => 'involved_id'
  has_many  :reports, :through => :officer_involvements

  # Methods
  def full_name
    return "#{first_name} #{last_name}"
  end
end
