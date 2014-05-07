require 'test_helper'

class StatusesControllerTest < ActionController::TestCase

  setup :initialize_status

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @status.id
    assert_response :success
    assert_not_nil assigns(:status)
  end

  test "should create a status" do 
    assert_difference("Status.count") do
      get :create, status: {name: "never finished", project_count: 12}
    end
    assert_redirected_to status_path(assigns(:status))
  end

  test "should update a status" do
    patch :update, :id => @status.id, status: {name: "always finished", project_count: 2}
    assert_redirected_to status_path
  end

  test "should delete a status" do
    assert_difference("Status.count",-1) do
      get :destroy, :id => @status.id
    end
  end


  private
    def initialize_status
      @status = statuses(:one)
    end


        
end
