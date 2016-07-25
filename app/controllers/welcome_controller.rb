class WelcomeController < ApplicationController

	before_action :authenticate_admin!, only: [:index]

	def index
		flash[:warning] = "Need Lunch ..."
	end
end
