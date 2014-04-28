class Project < ActiveRecord::Base
	belongs_to :unit
	belongs_to :status
	validates_presence_of :name
	validates_presence_of :description
end
