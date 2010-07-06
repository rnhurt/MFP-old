require 'test_helper'

class OfficerInvolvementTest < ActiveSupport::TestCase
  should belong_to(:report)
  should belong_to(:officer)
  should belong_to(:role)
end
