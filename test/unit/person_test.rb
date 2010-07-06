require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  should belong_to(:person_master)
  should belong_to(:race)
  should belong_to(:gender)
  should belong_to(:hair_color)
  should belong_to(:eye_color)

  should have_many(:person_locations)
  should have_many(:locations).through(:person_locations)
end
