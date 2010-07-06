require 'test_helper'

class VehicleInvolvementTest < ActiveSupport::TestCase
  should belong_to(:report)
  should belong_to(:vehicle)
  should belong_to(:status)
end
