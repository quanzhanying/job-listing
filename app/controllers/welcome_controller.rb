class WelcomeController < ApplicationController

	before_action :authenticate_admin!, only: [:index]

	def index
		flash[:notice] = "Lunch Finished..."
	end
end
