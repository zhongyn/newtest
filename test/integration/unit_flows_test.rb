require 'test_helper'

class UnitFlowsTest < ActionDispatch::IntegrationTest
  fixtures :units

  test "Open and browse site" do
  	https!
  	get "/units"
  	assert_response :success

  	#post_via_redirect('/units/new', name: "Boston train", member_count: 24)
  	
  end

end
