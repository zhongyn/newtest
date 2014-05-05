require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  test "A unit can be created" do
  	unit = Unit.new
  	unit.name = "testing"
  	unit.member_count = 13
  	assert unit.save
  end

  test "A unit cannot be created without a name" do
  	unit = Unit.new
  	unit.name = nil
  	unit.member_count = 13
  	assert_not unit.save
  end

  test "Unit can be updated" do
  	unit = units(:one)
  	unit.name = "Testing"
  	assert unit.save
  end

end
