require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  should have_many(:people)
end
