class Project < ActiveRecord::Base
	belongs_to :unit

	validates_presence_of :name
	validates_presence_of :description
end
