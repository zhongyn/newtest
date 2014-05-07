require 'test_helper'

class UnitsControllerTest < ActionController::TestCase

  setup :initialize_unit

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units)
  end

  test "should get show" do
    get :show, :id => units(:one).id, :name => "cat"
    assert_response :success
  end

  test "should route to unit" do
    assert_routing '/units/1', {controller: "units", action: "show", id: "1"}
  end
  
  test "should create unit" do
  	assert_difference("Unit.count") do
  		get :create, unit: {name: "beaver nation", member_count: 15}
  	end
  	assert_redirected_to unit_path(assigns(:unit))
  end

  test "should update unit" do
    patch :update, :id => @unit.id, unit: {name: "transformer", member_count: 3}
    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should delete unit" do
    assert_difference("Unit.count", -1) do
      get :destroy, :id => @unit.id
    end
    assert_redirected_to units_path
  end

  private
    def initialize_unit
      @unit = units(:one)
    end

end
