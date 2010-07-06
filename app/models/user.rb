class User < ActiveRecord::Base
  acts_as_authentic

  attr_protected :admin

	validates_length_of	:login, :in => 1..20
	validates_length_of :first_name,  :in => 1..40
	validates_length_of :last_name,   :in => 1..40

  named_scope :active, :conditions => {:active => true}
  named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

  # Return the users full name
  def full_name
    return "#{first_name} #{last_name}"
  end

  # Define different roles for each user to play.  This is mainly used for authentication purposes.
  ROLES = %w[admin chief officer secretary]
  def roles=(roles)
    debugger
    #    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
    self.roles_mask = ([*roles] & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    #    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
    ROLES.reject { |r| (roles_mask || 0)[ROLES.index(r)].zero? }
  end

  def role?
    roles.include? role.to_s
  end

end
