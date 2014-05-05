require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "A status should have a name" do
  	status = statuses(:one)
  	status.name = nil
  	assert_not status.save
  end

end
