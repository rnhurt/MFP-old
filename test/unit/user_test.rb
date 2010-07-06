require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_not  allow_value('This is a really long name that probably shouldn\'t be legal because it is too long').for(:first_name)
  should_not  allow_value('').for(:first_name)
  should      allow_value('John').for(:first_name)

  should_not  allow_value('This is a really long name that probably shouldn\'t be legal because it is too long').for(:last_name)
  should_not  allow_value('').for(:last_name)
  should      allow_value('Smith').for(:last_name)

  should_not  allow_value('This is a really long name that probably shouldn\'t be legal because it is too long').for(:login)
  should_not  allow_value('').for(:login)
  should      allow_value('1922-smith_1').for(:login)

  should_not  allow_value("blah").for(:email)
  should_not  allow_value("b lah").for(:email)
  should      allow_value("a@b.com").for(:email)
  should      allow_value("asdf@asdf.com").for(:email)

  should_not  allow_mass_assignment_of(:admin)

  context 'A user' do
    setup do
      @user = Factory(:user, :first_name => 'John', :last_name => 'Doe')
    end

    should 'return its full name' do
      assert_equal 'John Doe', @user.full_name
    end
  end

end
