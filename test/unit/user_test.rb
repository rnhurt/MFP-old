require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def test_user_first_name_limits
    user = Factory.build(:user, :first_name => 'This is a really long name that probably shouldn\'t be legal because it is too long')
		assert !user.valid?, 'First Name too long'

		user = Factory.build(:user, :first_name => '')
		assert !user.valid?, 'First Name too short'

		user = Factory.build(:user)
		assert !user.valid?, 'First Name just right'
	end

	def test_user_last_name_limits
    user = Factory.build(:user, :last_name => 'This is a really long name that probably shouldn\'t be legal because it is too long')
		assert !user.valid?, 'Last Name too long'

		user = Factory.build(:user, :last_name => '')
		assert !user.valid?, 'Last Name too short'

		user = Factory.build(:user)
		assert !user.valid?, 'Last Name just right'
	end

  def test_user_login_limits
    user = Factory.build(:user, :login => 'This is a really long name that probably shouldn\'t be legal because it is too long')
		assert !user.valid?, 'Login too long'

		user = Factory.build(:user, :login => '')
		assert !user.valid?, 'Login too short'

		user = Factory.build(:user)
		assert !user.valid?, 'Login just right'
	end

end
