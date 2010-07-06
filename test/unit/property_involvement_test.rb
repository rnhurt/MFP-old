require 'test_helper'

class PropertyInvolvementTest < ActiveSupport::TestCase
  should belong_to(:report)
  should belong_to(:property)
  should belong_to(:role)
end
