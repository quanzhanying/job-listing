module FlashHelper
	def convert(key)
		case key
		when "alert"
			"danger"
		when "notice"
			"success"
		when "warning"
			"warning" 
		end
	end
end