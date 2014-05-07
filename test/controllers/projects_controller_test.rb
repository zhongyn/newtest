
require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

	setup :initialize_project

	
	def teardown
	@project = nil
	end

	test "should get index" do
		get :index, :unit_id => @project.unit_id
		assert_response :success
		assert_not_nil assigns(:projects)
	end

	test "should get show" do
		get :show, :unit_id => @project.unit_id, :id => @project.id
		assert_response :success
		assert_not_nil assigns(:project)
	end

	test "should create project" do
		assert_difference("Project.count") do
			get :create, :unit_id => units(:one).id, project: {name: "climb Mary's peak", description: "at weekend"}
		end
		assert_redirected_to unit_projects_path
	end

	test "should update project" do
		patch :update, :id => @project.id, :unit_id => @project.unit_id, project: {name: "weekly meeting", description: "what should i say"}
		assert_redirected_to unit_project_path
	end

	test "should delete a project" do 
		assert_difference("Project.count", -1) do
			get :destroy, :id => @project.id, :unit_id => @project.unit_id
		end   
	end

	private

		def initialize_project
		  @project = projects(:one)
		end

end

	
