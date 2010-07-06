require 'test_helper'

class PersonLocationTest < ActiveSupport::TestCase
  should belong_to(:person)
  should belong_to(:location)
  should belong_to(:role)
end
