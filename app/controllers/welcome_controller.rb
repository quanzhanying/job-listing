class WelcomeController < ApplicationController

	

	def index
		flash[:notice] = "Lunch Finished..."
	end
end
