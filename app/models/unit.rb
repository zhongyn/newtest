class Unit < ActiveRecord::Base

    validates_presence_of :name
    validates_numericality_of :member_count
end
