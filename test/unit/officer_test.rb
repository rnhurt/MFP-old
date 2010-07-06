require 'test_helper'

class OfficerTest < ActiveSupport::TestCase
  should have_many(:officer_involvements)
  should have_many(:reports).through(:officer_involvements)
end
