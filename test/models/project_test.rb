require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
   test "A project can be created" do
     project = Project.new
     project.name = "painting house"
     project.description = "painting all the buildings in corvallis"
     assert project.save
   end

   test "A project can be updated" do
   	 project = projects(:one)
   	 project.name = "collecting apple"
   	 project.description = "panda change his food plan"
   	 assert project.save
   	end

   	test "A project should have a name" do
   		project = projects(:one)
   		project.name = nil
   		assert_not project.save
   	end

   	test "A project belongs to a unit" do
   		unit = projects(:one).unit
   		assert unit.name 
   	end

   	test "A project belongs to a status" do
   		status = projects(:one).status
   		assert status.name
   	end
   	
end
