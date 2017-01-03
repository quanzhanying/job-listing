class WelcomeController < ApplicationController
	def index
		flash[:alert] = "morning!"
	end
end
