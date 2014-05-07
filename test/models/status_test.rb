require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  
  setup :initialize_status

  test "A status should have a name" do
  	#status = statuses(:one)
  	@status.name = nil
  	assert_not @status.save
  end

  test "A status should have a project count" do
  	#status = statuses(:one)
  	@status.project_count = nil
  	assert_not @status.save
  end

  test "A status can be updated" do
  	@status.name = "The best status"
  	@status.project_count = 34
  	assert @status.save
  end 


  private
    def initialize_status
    	@status = statuses(:one)
    end

end
