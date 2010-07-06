require 'test_helper'

class PersonMasterTest < ActiveSupport::TestCase
  should have_many(:people)
end
