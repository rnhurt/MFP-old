require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should have_many(:reports)
  should have_many(:person_locations)
end
