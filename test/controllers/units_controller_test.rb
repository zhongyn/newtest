require 'test_helper'

class UnitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units)
  end

  test "should get show" do
    get :show, :id => units(:one).id, :name => "cat"
    assert_response :success
  end

  test "should create unit" do
  	assert_difference("Unit.count") do
  		get :create, unit: {name: "beaver nation", member_count: 15}
  	end
  	assert_redirected_to unit_path(assigns(:unit))
  end


end
