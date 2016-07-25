class WelcomeController < ApplicationController

	def index
		flash[:warning] = "Need Lunch ..."
	end
end
