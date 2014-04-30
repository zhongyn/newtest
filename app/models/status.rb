class Status < ActiveRecord::Base
	has_many :projects
	validates_presence_of :name
	validates_numericality_of :project_count

end
