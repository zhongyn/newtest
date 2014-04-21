class Unit < ActiveRecord::Base
    has_many :projects

    validates_presence_of :name
    validates_numericality_of :member_count
end
