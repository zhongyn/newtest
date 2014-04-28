module ApplicationHelper

	# This method checks the level of our flash and returns a string of css classes
	def flash_class(level)
	    case level
	        when "alert" then "alert alert-error"
	        else "alert alert-success"
	    end
	end

end
