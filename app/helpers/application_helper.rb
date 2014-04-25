module ApplicationHelper

	def flash_class(level)
	    case level
	        when "info" then "alert alert-info"
	        when "notice" then "alert alert-success"
	        when "error" then "alert alert-error"
	        when "warning" then "alert alert-error"
	    end
	end


end
