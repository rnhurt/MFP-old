require 'test_helper'

class PersonInvolvementTest < ActiveSupport::TestCase
  should belong_to(:report)
  should belong_to(:person)
  should belong_to(:role)
end
